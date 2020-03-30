//
//  NetworkingClient.swift
//  AlamofireMVCDataSample3
//
//  Created by iHub on 30/03/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import Foundation

import Alamofire

class NetworkingClient: NSObject {
        
    static let networkingClient = NetworkingClient()
    
    func excuteGetServiceCall(url:String, controller:UIViewController, completion: @escaping (_ result: DataResponse<Any>) -> Void) {
        
        print("URL:\(url)")
                
        Alamofire.request(url, encoding: JSONEncoding.default
            ).responseJSON{
                response in
                    completion(response)
            }
    }
}
