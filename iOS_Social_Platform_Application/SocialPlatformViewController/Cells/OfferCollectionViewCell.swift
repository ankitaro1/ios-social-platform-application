//
//  OfferCollectionViewCell.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import UIKit
import Nuke

class OfferCollectionViewCell: UICollectionViewCell {

    @IBOutlet var offerImageView: UIImageView?
    
    var data: SocialOfferUIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData() {
        Nuke.loadImage(with: data?.iconUrl, into: self.offerImageView ?? UIImageView())
        self.offerImageView?.target(forAction: #selector(launchAlert), withSender: nil)
    }
    
    @objc
    func launchAlert() {
        
    }

}
