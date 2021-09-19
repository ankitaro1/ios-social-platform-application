//
//  SocialPlatformModel.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma on 19/09/21.
//
//

import Foundation


class SocialPlatformResponseDAO: Decodable {
    let feeds: [SocialPlatformFeed]
    
    enum CodingKeys: String, CodingKey {
        case feeds
    }
    
     enum SocialPlatformFeed: Decodable {
        
        case car(SocialPlatformCar)
        case features([SocialPlatformFeature])
        case offers([SocialPlatformOffer])
        
        enum DecodingError: Error {
            case wrongJSON
        }
        
        enum CodingKeys: String, CodingKey {
                    case car
                    case features
                    case offers
                }
        init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    switch container.allKeys.first {
                    case .car:
                        let value = try container.decodeIfPresent(SocialPlatformCar.self, forKey: .car)
                        self = .car(value!)
                    case .features:
                        let value = try container.decodeIfPresent([SocialPlatformFeature].self, forKey: .features)
                        self = .features(value ?? [])
                    case .offers:
                        let value = try container.decodeIfPresent([SocialPlatformOffer].self, forKey: .offers)
                        self = .offers(value ?? [])
                    case .none:
                        throw DecodingError.wrongJSON
            }
        }
    }
}


// MARK: - Car
class SocialPlatformCar: Decodable {
    let regNo, fuelType, transmission, make, image: String

    enum CodingKeys: String, CodingKey {
        case image, regNo, fuelType, transmission, make
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        regNo = try container.decode(String.self, forKey: .regNo)
        fuelType = try container.decode(String.self, forKey: .fuelType)
        image = try container.decode(String.self, forKey: .image)
        transmission = try container.decode(String.self, forKey: .transmission)
        make = try container.decode(String.self, forKey: .make)
      }
    
}

// MARK: - Feature
class SocialPlatformFeature: Decodable {
    let imageUrl: String
    let screenName: String
    let redirectUrl: String

    enum CodingKeys: String, CodingKey {
        case imageUrl
        case screenName
        case redirectUrl
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        screenName = try container.decode(String.self, forKey: .screenName)
        redirectUrl = try container.decode(String.self, forKey: .redirectUrl)
      }
}

// MARK: - Offer
class SocialPlatformOffer: Decodable {
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case image
        case name
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        image = try container.decode(String.self, forKey: .image)
        name = try container.decode(String.self, forKey: .name)
      }
}
