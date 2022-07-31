//
//  RegionsTVC.swift
//  CoronavirusAPI
//
//  Created by Islomjon on 24/07/22.
//

import UIKit

class RegionsTVC: UITableViewCell {
    
    static let identifier:String = "RegionsTVC"
    static func uinib()->UINib {
        return UINib(nibName: "RegionsTVC", bundle: nil)
    }
    @IBOutlet weak var containerView: UIView!{
        didSet {
            containerView.layer.masksToBounds = false
            containerView.layer.shadowColor = UIColor.lightGray.cgColor
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowOpacity = 0.3
            containerView.layer.shadowRadius = 8
        }
    }
    @IBOutlet weak var regionNameLbl: UILabel!
    @IBOutlet weak var regionIsoLbl: UILabel!
    @IBOutlet weak var flagIcon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func updateRegion(region:RegionDM){
        regionNameLbl.text = region.name
        regionIsoLbl.text = region.iso
        flagIcon.text = region.flag
    }
    
    func updateCity(city:CityDM){
        regionNameLbl.text = city.name
    }

}
