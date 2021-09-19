//
//  MediaCollectionViewCell.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import UIKit
import Nuke

class MediaCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mediaIcon: UIImageView?
    
    @IBOutlet var mediaLabel: UILabel?
    
    var data: SocialMediaUIModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mediaIcon?.layer.cornerRadius = (self.mediaIcon?.frame.height ?? 0) / 2
    }
    
    func setData() {
        self.mediaLabel?.text = self.data?.name
        Nuke.loadImage(with: data?.iconUrl, into: self.mediaIcon ?? UIImageView())
    }
}
