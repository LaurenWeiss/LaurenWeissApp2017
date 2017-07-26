//
//  LifeExpectancyCalculator.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation

class LifeExpectancyCalculator {
    var totalAge = 0.0
    
    static func calculateAge(forUser user: User, onCompletion: @escaping (Double) -> Void) {
        
        var baseAge = 0.0
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        let dobString = formatter.string(from: (user.lifeSpecifications?.dob)!)
        let gender = user.lifeSpecifications?.sex
        let country = user.lifeSpecifications?.country
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIManager.getBaseAge(usingBirth: dobString, andGender: gender!, andCountry: country!) { (responseAge) in
            
            if let age = responseAge {
                baseAge = age
                dispatchGroup.leave()
            }
        }
        print("keep going")
        
        dispatchGroup.notify(queue: .main) {
            
            //smoking impact
            if (user.lifeSpecifications?.isSmoking)! {
                let agesToSubtract = LifeExpectancyCalculator.smokingImpact(lifeSpecs: user.lifeSpecifications!)
                baseAge = baseAge - agesToSubtract
            }
            
            onCompletion(baseAge)

            
            //diabetes impact
            
            //sport impact
  
        }
    }
    
    
    private static func smokingImpact(lifeSpecs: LifeSpecs) -> Double {

        switch lifeSpecs.numCigarettesPerDay {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            //3
            return 4
        }

    }
    

    

    
}
