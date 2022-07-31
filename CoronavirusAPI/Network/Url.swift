//
//  Url.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 26/07/22.
//

import Foundation
import Alamofire

struct Url{
    
    static let regions:String = "https://covid-19-statistics.p.rapidapi.com/regions"
    static let provinces:String = "https://covid-19-statistics.p.rapidapi.com/provinces"
    static let totalReports:String = "https://covid-19-statistics.p.rapidapi.com/reports/total"
    static let reports:String = "https://covid-19-statistics.p.rapidapi.com/reports"
    
    static let header:HTTPHeaders = [
        "X-RapidAPI-Key": "1efba3c152msh4580fa2307bb546p170c81jsnee0e6e153b82",
        "X-RapidAPI-Host": "covid-19-statistics.p.rapidapi.com"
    ]
    
}
