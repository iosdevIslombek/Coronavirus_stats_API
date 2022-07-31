//
//  ReportDM.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 24/07/22.
//

import Foundation
import SwiftyJSON

struct ReportDM {
    
    var date: String
    var confirmed: Int
    var deaths: Int
    var recovered :Int
    var confirmed_diff: Int
    var deaths_diff: Int
    var recovered_diff: Int
    var active: Int
    var active_diff: Int
    var fatality_rate: Double
    var region: ProvinceDM
    
    init(report:JSON) {
        self.date = report["date"].stringValue
        self.confirmed = report["confirmed"].intValue
        self.deaths = report["deaths"].intValue
        self.recovered = report["recovered"].intValue
        self.confirmed_diff = report["confirmed_diff"].intValue
        self.deaths_diff = report["deaths_diff"].intValue
        self.recovered_diff = report["recovered_diff"].intValue
        self.active = report["active"].intValue
        self.active_diff = report["active_diff"].intValue
        self.fatality_rate = report["fatality_rate"].doubleValue
        self.region = ProvinceDM(province: report["region"])
    }
}
