//
//  APIManager.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/19/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class APIManager {

    static func getResponse(usingBirth birth: String, andGender gender: String, andCountry country: String, ifIsSmoking isSmoking: Bool, completionHandler: @escaping (LifeSpecs?) -> Void) {
        
        let baseURL = "http://api.population.io:80/1.0/life-expectancy/total/"
        
        guard let countryUrlAllowed = country.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            return
        }
        
        let url = "\(baseURL)\(gender)/\(countryUrlAllowed)/\(birth)"
        
//        let headers: HTTPHeaders = ["X-Amz-Cf-Id": "f0494da1a3fa927973f590922adec0fe87ecc02cb2d52da2590dd6435f623360"]
        
        Alamofire.request(url).responseData { (response) in
            
            let json = JSON(with: response.data!) as? JSON
            
            if let jsonForLifeSpecs = json {
                let lifeSpecs = LifeSpecs(withJSON: jsonForLifeSpecs, andSmokingInfo: isSmoking)
                completionHandler(lifeSpecs)
            } else {
                completionHandler(nil)
            }
            
        }
    }
    
}
