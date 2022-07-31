//
//  MoreInfoVC.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 28/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class MoreInfoVC: UIViewController {
    
    var province = ProvinceDM(province: "")
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor.red.cgColor
        }
    }
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var confirmedLbl: UILabel!
    @IBOutlet weak var confirmedDiffLbl: UILabel!
    @IBOutlet weak var deathLbl: UILabel!
    @IBOutlet weak var deathDiffLbl: UILabel!
    @IBOutlet weak var recoveredLbl: UILabel!
    @IBOutlet weak var recoveredDiffLbl: UILabel!
    @IBOutlet weak var activeLbl: UILabel!
    @IBOutlet weak var activeDiffLbl: UILabel!
    @IBOutlet weak var fatalityLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.string(from: Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        getData(date: date)
    }
    
    func getData(date:String){
        if Reachability.isConnectedToNetwork() {
            let params = [
                "iso": province.iso,
                "region_province": province.province,
                "region_name": province.name,
                "q": province.q,
                "date": date
            ]
            AF.request(Url.reports, method: .get, parameters: params, headers: Url.header).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    let info = ReportDM(report: json["data"][0])
                    self.cityLbl.text = info.region.province+", "+info.region.name+info.region.flag
                    self.confirmedLbl.text = info.confirmed.formatnumber()
                    self.confirmedDiffLbl.text = info.confirmed_diff.formatnumber()
                    self.deathLbl.text = info.deaths.formatnumber()
                    self.deathDiffLbl.text = info.deaths_diff.formatnumber()
                    self.recoveredLbl.text = info.recovered.formatnumber()
                    self.recoveredDiffLbl.text = info.recovered_diff.formatnumber()
                    self.activeLbl.text = info.active.formatnumber()
                    self.activeDiffLbl.text = info.active_diff.formatnumber()
                    self.fatalityLbl.text = String(format: "%.2f", info.fatality_rate*100)+"%"
                }
            }
        }else {
            print("not connection")
        }
    }
    
    @IBAction func largeBtnTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
