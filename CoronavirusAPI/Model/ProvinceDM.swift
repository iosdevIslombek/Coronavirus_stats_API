//
//  ProvinceDM.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 24/07/22.
//

import Foundation
import SwiftyJSON

struct ProvinceDM {
    
    var iso: String
    var name:String
    var province:String
    var lat:Double
    var long:Double
    
    var flag:String {
        return IsoCountryCodes.find(key: iso)?.flag ?? ""
    }
    
    var q:String {
        return name+" "+province
    }
    
    var latString:String {
        return "lat: \(String(format: "%.2f", lat))"
    }
    
    var longString:String {
        return "long: \(String(format: "%.2f", long))"
    }

    
    init(province:JSON) {
        self.iso = province["iso"].stringValue
        self.name = province["name"].stringValue
        self.province = province["province"].stringValue
        self.lat = province["lat"].doubleValue
        self.long = province["long"].doubleValue
    }
    
}
