//
//  SocialPlatformUIModel.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma7 on 19/09/21.
//

import Foundation


public struct SocialVehicleUIModel {
    let name: String
    let number: String
    let iconUrl: String
    let type: String
}


public struct SocialMediaUIModel {
    let name: String
    let iconUrl: String
    let redirectUrl: String
}

public struct SocialOfferUIModel {
    let iconUrl: String
    let name: String
}


public struct SocialPlatformUIModel {
    let vehicle: SocialVehicleUIModel
    let mediaList: [SocialMediaUIModel]
    let offerList: [SocialOfferUIModel]
}
