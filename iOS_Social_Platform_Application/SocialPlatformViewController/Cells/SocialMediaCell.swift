//
//  SocialMediaCell.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import UIKit

class SocialMediaCell: UITableViewCell {

    @IBOutlet var socialCollectionView: UICollectionView?
    
    @IBOutlet var containerView: UIView?
    var dataSource: SocialCollectionDatasource = SocialCollectionDatasource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView?.layer.borderWidth = CGFloat(1)
        self.containerView?.layer.cornerRadius = CGFloat(1)
        self.socialCollectionView?.delegate = dataSource
        self.socialCollectionView?.dataSource = dataSource
        self.socialCollectionView?.register(UINib(nibName: "MediaCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "MediaCollectionViewCell")
        self.socialCollectionView?.register(UINib(nibName: "OfferCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "OfferCollectionViewCell")
    }
    
    func setData(mediaList: [SocialMediaUIModel] = [], offerList: [SocialOfferUIModel] = [], type: CellType) {
        self.dataSource.celltype = type
        self.dataSource.mediaList = mediaList
        self.dataSource.offerList = offerList
    }

}
