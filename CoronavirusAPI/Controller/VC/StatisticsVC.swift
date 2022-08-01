//
//  StatisticsVC.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 27/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit
import Lottie

class StatisticsVC: UIViewController {
    
    var regions:[RegionDM] = []
    var allRegion: [RegionDM] = []
    var totalReport:[TotalReportDM] = []
    
    let animationView = AnimationView()
    
    let headerView: UIView = {
       let view = UIView()
        return view
    }()
    
    // -- Confirmed View --
    let confirmedView: UIView = {
       let v = UIView()
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        v.backgroundColor = #colorLiteral(red: 0.9343957305, green: 0.3161073923, blue: 0.3543936312, alpha: 1)
        return v
    }()
    
    let confirmedCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.systemFont(ofSize: 19)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let confirmedLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Confirmed"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let confirmedStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 0
        return s
    }()
    
    // -- Active View --
    let activeView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.185772866, green: 0.3928028941, blue: 0.7621440291, alpha: 1)
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        return v
    }()
    
    let activeCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.systemFont(ofSize: 19)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let activeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Active"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let activeStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 0
        return s
    }()
    
    // -- Death View --
    let deathView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.34475559, green: 0.369159162, blue: 0.3861819506, alpha: 1)
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        return v
    }()
    
    let deathCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.systemFont(ofSize: 19)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let deathLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Death"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let deathStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 0
        return s
    }()
    
    // -- Fatality rate View --
    let fatalityView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2399861515, green: 0.8030771613, blue: 0.7973563075, alpha: 1)
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        return v
    }()
    
    let fatalityCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.systemFont(ofSize: 19)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let fatalityLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Fatality rate"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let fatalityStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 0
        return s
    }()
    
    // -- Last update View  --
    let updateView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2685214877, green: 0.5140336156, blue: 0.2673241794, alpha: 0.8525789779)
        v.layer.cornerRadius = 4
        v.clipsToBounds = true
        return v
    }()
    
    let updateCount: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.font = UIFont.systemFont(ofSize: 19)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let updateLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Last update"
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let updateStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 0
        return s
    }()
    
    let confirmedActiveStackView: UIStackView = {
       let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 8
        return s
    }()
    
    let deathFatalityStackView: UIStackView = {
       let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fillEqually
        s.spacing = 8
        return s
    }()
    
    let bigStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.alignment = .fill
        s.distribution = .fill
        s.spacing = 8
        return s
    }()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.tableHeaderView = headerView
            tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
            tableView.register(RegionsTVC.uinib(), forCellReuseIdentifier: RegionsTVC.identifier)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Statistics"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        getTotalReport(date: date)
        navBar()
        getData()
        setHeaderUI()
        tableView.startAnimation(name: "global")
    }
    
    func getTotalReport(date:String){
        if Reachability.isConnectedToNetwork() {
            let params = [
                "date": date
            ]
            AF.request(Url.totalReports, method: .get, parameters: params, headers: Url.header).response { response in
                if let data = response.data {
                    self.tableView.stopAnimation()
                    let json = JSON(data)
                    let stats = TotalReportDM(totalReport: json["data"])
                    self.totalReport.append(stats)
                    self.confirmedCount.text = stats.confirmed.formatnumber()
                    self.activeCount.text = stats.active.formatnumber()
                    self.deathCount.text =  stats.deaths.formatnumber()
                    self.fatalityCount.text = String(format: "%.2f", stats.fatality_rate*100)+"%"
                    self.updateCount.text = "\(stats.updateDate)"
                }
            }
        }else{
            print("not connection")
        }
        
    }
    
    func getData(){
        if Reachability.isConnectedToNetwork() {
            AF.request(Url.regions, method: .get, encoding: JSONEncoding.default, headers: Url.header).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    for i in json["data"].arrayValue{
                        let region = RegionDM(region: i)
                        self.regions.append(region)
                    }
                }
                self.tableView.reloadData()
            }
        }else{
            print("not connection")
        }
    }
    
    func navBar(){
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.placeholder = "Search country"
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
    }
    
    func setHeaderUI() {
        
        headerView.snp.makeConstraints { make in
            make.left.top.right.equalTo(tableView).inset(0)
            make.width.equalTo(self.tableView)
        }
        
        self.confirmedView.addSubview(confirmedStackView)
        confirmedStackView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(confirmedView).inset(5)
        }
        confirmedStackView.addArrangedSubview(confirmedCount)
        confirmedStackView.addArrangedSubview(confirmedLbl)
        
        self.activeView.addSubview(activeStackView)
        activeStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(activeView).inset(5)
        }
        activeStackView.addArrangedSubview(activeCount)
        activeStackView.addArrangedSubview(activeLbl)
        
        self.deathView.addSubview(deathStackView)
        deathStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(deathView).inset(5)
        }
        deathStackView.addArrangedSubview(deathCount)
        deathStackView.addArrangedSubview(deathLbl)
        
        self.fatalityView.addSubview(fatalityStackView)
        fatalityStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(fatalityView).inset(5)
        }
        fatalityStackView.addArrangedSubview(fatalityCount)
        fatalityStackView.addArrangedSubview(fatalityLbl)
        
        self.updateView.addSubview(updateStackView)
        updateStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(updateView).inset(5)
        }
        updateStackView.addArrangedSubview(updateCount)
        updateStackView.addArrangedSubview(updateLbl)
        
        confirmedActiveStackView.addArrangedSubview(confirmedView)
        confirmedActiveStackView.addArrangedSubview(activeView)
        
        deathFatalityStackView.addArrangedSubview(deathView)
        deathFatalityStackView.addArrangedSubview(fatalityView)
        
        self.headerView.addSubview(bigStackView)
        bigStackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(headerView).inset(8)
        }
        bigStackView.addArrangedSubview(confirmedActiveStackView)
        bigStackView.addArrangedSubview(deathFatalityStackView)
        bigStackView.addArrangedSubview(updateView)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -

extension StatisticsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return regions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegionsTVC.identifier, for: indexPath) as? RegionsTVC else {
            return UITableViewCell()
        }
        cell.updateRegion(region: regions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CityVC(nibName: "CityVC", bundle: nil)
        vc.province = regions[indexPath.row]
        vc.navTitle = regions[indexPath.row].name + " " + regions[indexPath.row].flag
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UISearchBarDelegate -
extension StatisticsVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        allRegion = regions
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        regions = regions.filter({ r in
            r.name.contains(searchText)
        })
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        regions = allRegion
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
        searchBar.text = nil
        tableView.reloadData()
    }
    
}

