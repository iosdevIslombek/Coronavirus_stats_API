//
//  TotalReportDM.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 24/07/22.
//

import Foundation
import SwiftyJSON

struct TotalReportDM {
    
    var last_update:String
    var confirmed: Int
    var confirmed_diff: Int
    var deaths: Int
    var deaths_diff: Int
    var recovered: Int
    var recovered_diff: Int
    var active: Int
    var active_diff: Int
    var fatality_rate: Double
    
    var updateDate:String {
        let getDate = DateFormatter()
        getDate.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, h:mm a"
        
        let date = getDate.date(from: last_update)
        return formatter.string(from: date!)
        
    }
    
    init(totalReport:JSON) {
        self.last_update = totalReport["last_update"].stringValue
        self.confirmed = totalReport["confirmed"].intValue
        self.confirmed_diff = totalReport["confirmed_diff"].intValue
        self.deaths = totalReport["deaths"].intValue
        self.deaths_diff = totalReport["deaths_diff"].intValue
        self.recovered = totalReport["recovered"].intValue
        self.recovered_diff = totalReport["recovered_diff"].intValue
        self.active = totalReport["active"].intValue
        self.active_diff = totalReport["active_diff"].intValue
        self.fatality_rate = totalReport["fatality_rate"].doubleValue
    }
    
}
