//
//  SocialVehicleCell.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import UIKit
import Nuke

class SocialVehicleCell: UITableViewCell {

    @IBOutlet weak var container: UIView?
    @IBOutlet weak var vehicleImageView: UIImageView?
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var numberLabel: UILabel?
    @IBOutlet weak var typeLabel: UILabel?
    
    var data: SocialVehicleUIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.container?.layer.borderColor = UIColor.black.cgColor
        self.container?.layer.borderWidth = CGFloat(1)
    }
    
    func setData() {
        Nuke.loadImage(with: data?.iconUrl, into: self.vehicleImageView ?? UIImageView())
        self.nameLabel?.text = data?.name
        self.numberLabel?.text = data?.number
        self.typeLabel?.text = data?.type
    }
}
