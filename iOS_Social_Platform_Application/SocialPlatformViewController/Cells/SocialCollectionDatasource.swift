//
//  SocialCollectionDatasource.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import Foundation
import UIKit


class SocialCollectionDatasource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var celltype: CellType?
    var mediaList: [SocialMediaUIModel] = []
    var offerList: [SocialOfferUIModel] = []
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.celltype == CellType.media {
            return self.mediaList.count
        } else {
            return self.offerList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.celltype == CellType.media {
            let cell: MediaCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediaCollectionViewCell", for: indexPath) as? MediaCollectionViewCell ?? MediaCollectionViewCell()
            cell.data = self.mediaList[indexPath.row]
            cell.setData()
            return cell
        } else {
            let cell: OfferCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as? OfferCollectionViewCell ?? OfferCollectionViewCell()
            cell.data = self.offerList[indexPath.row]
            cell.setData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if celltype == CellType.media {
            return CGSize(width: (UIScreen.main.bounds.width / 4)  , height: CGFloat(90))
        } else {
            return CGSize(width: UIScreen.main.bounds.width - CGFloat(20), height: CGFloat(400))
        }
        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let window = UIApplication.shared.keyWindow
        let rootViewController = window?.rootViewController
        if self.celltype == CellType.media {
            let targetVC = SocialWebVC()
            targetVC.loadUrl = self.mediaList[indexPath.row].redirectUrl
            rootViewController?.children.last?.navigationController?.pushViewController(targetVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: self.offerList[indexPath.row].name, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            rootViewController?.children.last?.present(alert, animated: true, completion: nil)
        }
    }

}

enum CellType {
    case offer
    case media
}
