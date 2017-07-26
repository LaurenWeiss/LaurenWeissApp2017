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

    static func getBaseAge(usingBirth birth: String, andGender gender: String, andCountry country: String, onCompletion: @escaping (Double?) -> Void) {
        
        let baseURL = "http://api.population.io:80/1.0/life-expectancy/total/"
        
        guard let countryUrlAllowed = country.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
            return
        }
        
        let url = "\(baseURL)\(gender)/\(countryUrlAllowed)/\(birth)"
                
        Alamofire.request(url).responseData { (response) in
            
            guard let json = JSON(with: response.data!) as? JSON else {
                onCompletion(nil)
                return
            }
            
            let totalLE = json["total_life_expectancy"].double
            onCompletion(totalLE)
            
        }
    }
    
}

