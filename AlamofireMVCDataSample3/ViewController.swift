//
//  ViewController.swift
//  AlamofireMVCDataSample3
//
//  Created by iHub on 30/03/20.
//  Copyright © 2020 iHubTechnologiesPvtLtd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        callPost()
    }

    func callPost(){
        
    let postsUrl = "users"
        
    NetworkingClient.networkingClient.excuteGetServiceCall(url:constants.baseUrl+postsUrl, controller:self){ response in
                    
        if response.response?.statusCode == 200 {
        print("StatusCode:\(response.response!.statusCode)")
            
    
            do {
                            
                let decoder = JSONDecoder()
                let results = try decoder.decode([Users].self, from: response.data!)
                            
//                print("Result:\(results)")
                
                print("Name:\(results[0].name)")
                print("AddressStreet:\(results[0].address?.street)")
                print("AddressGeoLat:\(results[0].address?.geo?.lat)")
                print("CompanyName:\(results[0].company?.name)")
                
                } catch let error {
                    print("ErrorDescription:",error.localizedDescription)
                }
                        
            } else {
                print("StatusCode:\(response.response!.statusCode)")
            }
        }
    }

}
