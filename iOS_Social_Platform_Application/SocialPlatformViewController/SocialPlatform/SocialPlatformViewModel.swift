//
//  SocialPlatformViewModel.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma on 19/09/21.
//
//

import Foundation
import UIKit

public protocol SocialPlatformFlowDelegate: AnyObject {
    func socialPlatformSuccess(data: SocialPlatformUIModel)
    func socialPlatformFailed(message: String)
}

public class SocialPlatformViewModel {
    
    let dataSource: SocialPlatformDataSource = SocialPlatformDataSource()
    weak var delegate: SocialPlatformFlowDelegate?
    
    init(delegate: SocialPlatformFlowDelegate?) {
        self.delegate = delegate
    }
    
    public func performSocialPlatformAction() {
        self.dataSource.callSocialPlatformAPI(successCallBack: { (response) in
            var offerList: [SocialOfferUIModel] = []
            var medialList: [SocialMediaUIModel] = []
            var car: SocialVehicleUIModel?
            for item in response.feeds {
                switch item {
                        case .car(let vehicle):
                            car = SocialVehicleUIModel(name: vehicle.make, number: vehicle.regNo, iconUrl: vehicle.image, type: (vehicle.transmission + "-" + vehicle.fuelType))
                case .features(let list) :
                          for media in list {
                            medialList.append(SocialMediaUIModel(name: media.screenName ?? "", iconUrl: media.imageUrl ?? "", redirectUrl: media.redirectUrl ?? ""))
                                }
                case .offers(let list) :
                         for offer in list {
                            offerList.append(SocialOfferUIModel(iconUrl: offer.image, name: offer.name))
                         }
                }
            }
            self.delegate?.socialPlatformSuccess(data: SocialPlatformUIModel(vehicle: car ?? SocialVehicleUIModel(name: "", number: "", iconUrl: "", type: ""),
                                                                                                                                                                 mediaList: medialList,
                                                                                                                                                                 offerList: offerList))
            }
           ) { (error) in
            self.delegate?.socialPlatformFailed(message: error)
           }
       }
    
}
