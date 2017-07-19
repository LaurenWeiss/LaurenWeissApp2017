//
//  LifeSpecs.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/19/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import SwiftyJSON

class LifeSpecs {
    var dob: Date = Date()
    var totalLifeExpectancy: Double = 0.0
    var sex: String = "male"
    var country: String = "United States"
    
    var isSmoking: Bool = false
    
    
    init?(withJSON json: JSON, andSmokingInfo isSmoking: Bool) {
        guard let dobString = json["dob"].string, let totalLE = json["total_life_expectancy"].double, let sex = json["sex"].string, let country = json["country"].string else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        guard let dobDate = formatter.date(from: dobString) else {
            return
        }
        
        self.dob = dobDate
        
        if isSmoking == true {
            //subtract first and then:
            self.totalLifeExpectancy -= 10
            self.totalLifeExpectancy = totalLE
            print(totalLifeExpectancy)

        } else {
            self.totalLifeExpectancy = totalLE
        }
        self.sex = sex
        self.country = country
        self.isSmoking = isSmoking
    }
    
}
