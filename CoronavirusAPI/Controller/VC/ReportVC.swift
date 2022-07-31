//
//  ReportVC.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 25/07/22.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReportVC: UIViewController {
    
    var navTitle: String!
    var province = ProvinceDM(province: "")
    
    @IBOutlet weak var stekView: UIStackView!
    @IBOutlet weak var datePickerTf: UITextField!
    @IBOutlet weak var confirmedLbl: UILabel!
    @IBOutlet weak var deathLbl: UILabel!
    @IBOutlet weak var recoveredLbl: UILabel!
    @IBOutlet weak var confirmedDiffLbl: UILabel!
    @IBOutlet weak var deathDiffLbl: UILabel!
    @IBOutlet weak var recoveredDiffLbl: UILabel!
    @IBOutlet weak var activeLbl: UILabel!
    @IBOutlet weak var activeDiffLbl: UILabel!
    @IBOutlet weak var fatalityRateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = navTitle
        if #available(iOS 13.4, *) {
            setDatePicker()
        }
    }
    
    let datePicker = UIDatePicker()
    let maximumDate:Date = Calendar.current.date(byAdding: .year, value: 0, to: Date())!
    
    @available(iOS 13.4, *)
    func setDatePicker(){
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = .current
        datePicker.timeZone = TimeZone.init(identifier: "UTC")
        datePicker.datePickerMode = .dateAndTime
        datePicker.maximumDate = maximumDate
        datePicker.addTarget(self, action: #selector(getDate), for: .valueChanged)
        datePickerTf.inputView = datePicker
        
// MARK: - SET TOOLBAR -
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        let spaceBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.items = [spaceBtn, doneBtn]
        datePickerTf.inputAccessoryView = toolbar
    }
    
    @objc func getDate(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let myDay = formatter.string(from: datePicker.date)
        datePickerTf.text = myDay
    }
    
    @objc func doneTapped(){
        stekView.isHidden = false
        datePickerTf.resignFirstResponder()
        getData(date: datePickerTf.text!)
    }
    
    func getData(date:String){
        if Reachability.isConnectedToNetwork() {
            
            let params = [
                "region_province": province.province,
                "iso": province.iso,
                "region_name": province.name,
                "q": province.q,
                "date": date
            ]
            AF.request(Url.reports, method: .get, parameters: params, headers: Url.header).response { response in
                if let data = response.data {
                    let json = JSON(data)
                    let report = ReportDM(report: json["data"][0])
                    self.confirmedLbl.text = "\(report.confirmed)"
                    self.deathLbl.text = "\(report.deaths)"
                    self.recoveredLbl.text = "\(report.recovered)"
                    self.confirmedDiffLbl.text = "\(report.confirmed_diff)"
                    self.deathDiffLbl.text = "\(report.deaths_diff)"
                    self.recoveredDiffLbl.text = "\(report.recovered_diff)"
                    self.activeLbl.text = "\(report.active)"
                    self.activeDiffLbl.text = "\(report.active_diff)"
                    self.fatalityRateLbl.text = "\(report.fatality_rate)"
                }
            }
            
        }else{
            print("not connection")
        }
        
    }
    
}
