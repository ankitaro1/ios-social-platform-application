//
//  SocialPlatformDataSource.swift
//  iOS_Social_Platform_Application
//
//  Created by Ankit sharma on 19/09/21.
//
//

import Foundation
import Alamofire

class SocialPlatformDataSource {
    
    func callSocialPlatformAPI( successCallBack: @escaping (SocialPlatformResponseDAO) -> Void, errorCallBack: @escaping(String) -> Void) {
        guard let url = URL(string: "https://jsonkeeper.com/b/TMAP") else {
            errorCallBack("something went wrong in url")
           return
         }
        
        AF.request(url,method: .get).validate().responseDecodable(of: SocialPlatformResponseDAO.self) { response in
            if let item = response.value {
                successCallBack(item)
            } else if response.error != nil {
                errorCallBack(response.error?.localizedDescription ?? "")
            }
        }
    }
    
}
