//
//  CityDM.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 25/07/22.
//

import Foundation
import SwiftyJSON

struct CityDM {
    
    var name:String
    var confirmed:Int
    var deaths:Int
    var confirmed_diff:Int
    var deaths_diff:Int
    
    init(city:JSON) {
        self.name = city["name"].stringValue
        self.confirmed = city["confirmed"].intValue
        self.deaths = city["deaths"].intValue
        self.confirmed_diff = city["confirmed_diff"].intValue
        self.deaths_diff = city["deaths_diff"].intValue
    }
}
