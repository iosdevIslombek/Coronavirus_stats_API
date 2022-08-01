//
//  CityVC.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 28/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SnapKit

class CityVC: UIViewController {
    
    var navTitle: String!
    var province = RegionDM(region: "")
    var cities:[ReportDM] = []
    
//    let headerView: UIView = {
//        let v = UIView()
//        return v
//    }()
    @IBOutlet weak var headerView: UIView!
    
    
    let countryLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "City/Country"
        lbl.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        lbl.textColor = .link
        lbl.textAlignment = .left
        return lbl
    }()
    
    let confirmedLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Confirmed"
        lbl.textColor = .systemRed
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let activeLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Active"
        lbl.textColor = .systemGreen
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let deathLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Death"
        lbl.textColor = .label
        lbl.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        lbl.textAlignment = .center
        return lbl
    }()
    
    let smallStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .fill
        s.distribution = .fill
        s.spacing = 10
        return s
    }()
    
    let bigStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.alignment = .center
        s.distribution = .equalSpacing
        s.spacing = 10
        return s
    }()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
            tableView.register(CityTVC.uinib(), forCellReuseIdentifier: CityTVC.identifier)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navTitle
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        getData(date: date)
        self.tableView.startAnimation(name: "waiting")
        setHeaderUI()
    }
    
    func getData(date:String){
        if Reachability.isConnectedToNetwork() {
            let params = [
                "iso": province.iso,
                "region_name": province.name,
                "date": date
            ]
            AF.request(Url.reports, method: .get, parameters: params, headers: Url.header).response { response in
                if let data = response.data {
                    self.tableView.stopAnimation()
                    let json = JSON(data)
                    for i in json["data"].arrayValue{
                        let report = ReportDM(report: i)
                        self.cities.append(report)
                    }
                    self.tableView.reloadData()
                }
            }
        }else {
            print("no connection")
        }
    }
    
    func setHeaderUI() {
        
        self.headerView.addSubview(bigStackView)
        bigStackView.snp.makeConstraints { make in
            make.left.right.equalTo(headerView).inset(8)
            make.top.bottom.equalTo(headerView).inset(4)
        }
        bigStackView.addArrangedSubview(countryLbl)
        bigStackView.addArrangedSubview(smallStackView)
        
        smallStackView.addArrangedSubview(confirmedLbl)
        smallStackView.addArrangedSubview(activeLbl)
        smallStackView.addArrangedSubview(deathLbl)
    }
}

//MARK: -UITableViewDelegate, UITableViewDataSource
extension CityVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityTVC.identifier, for: indexPath) as? CityTVC else { return UITableViewCell() }
        cell.updateCell(report: cities[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MoreInfoVC(nibName: "MoreInfoVC", bundle: nil)
        vc.province = cities[indexPath.row].region
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
