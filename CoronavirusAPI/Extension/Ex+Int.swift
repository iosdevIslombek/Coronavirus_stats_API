//
//  Ex+Int.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 28/07/22.
//

import Foundation

extension Int {
    func formatnumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
}
