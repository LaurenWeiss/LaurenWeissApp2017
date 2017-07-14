//
//  Network.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/13/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class Network {
    
    static let baseURL: String = "https://life-left.p.mashape.com/time-left?"
    
    static func callAPI(usingBirth birth: String, andGender gender: String) {
        
        //appending to the base url to make a long string url
        let urlString = baseURL + "birth=\(birth)&gender=\(gender)"
        //makes into valid url
        let correctURL = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let validURL = URL(string: correctURL!)
        
        //sesion allows contact with servers
        let session = URLSession.shared
        var request = URLRequest(url: validURL!)
        request.setValue("hAVVDBRbTOmshEls4oXWyrEAJNXup1v3CgfjsnLVJlgiHqW9Zc", forHTTPHeaderField: "X-Mashape-Key")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        //dataTask makes the actual connection to the server
        let  dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard error == nil else {
                print("\(#function): \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard data != nil else {
                print("\(#function): data is nil.")
                return
            }
            
            guard let json = isValidJSON(json: data!) else {
                print("\(#function): failed to convert data to json.")
                return
            }
            
            //pass the json object to a different class to access it
            JSONParser.parse(json: json)
            //print(json)
        }
        
        dataTask.resume()
        //
    }
    
    
    //checks if data downloaded is a valid json object
    private static func isValidJSON(json data: Data) -> [String: Any]? {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print("JSON Error: \(error)")
            return nil
        }
    }


}
