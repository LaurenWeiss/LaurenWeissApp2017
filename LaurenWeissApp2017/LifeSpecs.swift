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
    var numCigarettesPerDay: Int!
    
    
    init?(withJSON json: JSON, andSmokingInfo isSmoking: Bool) {
        guard
            let dobString = json["dob"].string,
            let totalLE = json["total_life_expectancy"].double,
            let sex = json["sex"].string,
            let country = json["country"].string else {
            return
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        guard let dobDate = formatter.date(from: dobString) else {
            return
        }
        
        self.dob = dobDate
        
        if isSmoking {
            //subtract first and then:
            self.totalLifeExpectancy = totalLE
            self.totalLifeExpectancy -= 10
        } else {
            self.totalLifeExpectancy = totalLE
        }
        
        print(totalLifeExpectancy)

        
        self.sex = sex
        self.country = country
        self.isSmoking = isSmoking
    }
    
    func adjustLEBasedOnCigPacks() {
        if isSmoking {
            switch numCigarettesPerDay {
            case 0:
                self.totalLifeExpectancy -= 1
            case 1:
                self.totalLifeExpectancy -= 2
            case 2:
                self.totalLifeExpectancy -= 3
            default:
                //3
                self.totalLifeExpectancy -= 4
            }
        }
    }
    
}
