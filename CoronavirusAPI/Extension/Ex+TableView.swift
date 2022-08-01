//
//  Ex+TableView.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 01/08/22.
//

import Foundation
import UIKit
import Lottie

extension UITableView {
    
    func startAnimation(name: String) {
        let animationView = AnimationView()
        animationView.animation = Animation.named(name)
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFit
        self.backgroundView = animationView
        self.tableHeaderView?.isHidden = true
        animationView.play()
    }
    
    func stopAnimation(){
        self.tableHeaderView?.isHidden = false
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
    
    
}

