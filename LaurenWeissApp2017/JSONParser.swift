//
//  JSONParser.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/13/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//
import UIKit

class JSONParser {
    
    static func parse(json: [String: Any]) {
        
        guard let dataDict = json["data"] as? [String: Any] else {
            print("failed to access data key")
            return
        }
        
        guard let yearsLeft = dataDict["yearsLeft"] as? Int else {
            return
            
        }
        print(yearsLeft)
        
        guard let minutesLeft = dataDict["minutesLeft"] as? Int else {
            return
        }
        print(minutesLeft)
        guard let monthsLeft = dataDict["monthsLeft"] as? Int else {
            return
        }
        print(monthsLeft)
        //print(yearsLeft)
        //print(dataDict)
    }
}
