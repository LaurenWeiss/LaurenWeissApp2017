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
        
        guard let minutesLeft = dataDict["minutesLeft"] as? Int else {
            return
        }
        guard let monthsLeft = dataDict["monthsLeft"] as? Int else {
            return
        }
        guard let dateString = dataDict["dateString"] as? Int else {
            return
        }
        
        //print(yearsLeft)
        print(dataDict)
        print(yearsLeft)
        print(minutesLeft)
        print(monthsLeft)
        print(dateString)
    }
}
