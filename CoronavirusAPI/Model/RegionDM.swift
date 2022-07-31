//
//  RegionDM.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 24/07/22.
//

import Foundation
import SwiftyJSON

struct RegionDM {
    
    var name: String
    var iso: String
    
    var flag:String {
        return IsoCountryCodes.find(key: iso)?.flag ?? ""
    }
    
    init(region:JSON) {
        self.name = region["name"].stringValue
        self.iso = region["iso"].stringValue
    }
}
