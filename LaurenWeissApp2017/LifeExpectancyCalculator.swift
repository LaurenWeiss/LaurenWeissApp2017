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
        
        let dobString = formatter.string(from: (user.lifeSpecifications.dob))
        let gender = user.lifeSpecifications.sex
        let country = user.lifeSpecifications.country
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIManager.getBaseAge(usingBirth: dobString, andGender: gender, andCountry: country) { (responseAge) in
            
            if let age = responseAge {
                baseAge = age
                dispatchGroup.leave()
            }
        }
        print("keep going")
        
        dispatchGroup.notify(queue: .main) {
            
//GENERAL VIEW CONTROLLER Functions (that are not part of the "base" age)
    
            //bmi impact
            
            
            //bmi high because of muscle or fat impact
            
            
            //education impact
            
            
            //diabetes impact
            
            
//YOUR DAILY LIFE VIEW CONTROLLER Functions
            //exercise impact
            
            //flossing impact
            
            //hours of work per week impact
            
            
            //days of work per week impact
            
            //air quality impact
            
            
            //seatbelt impact
            
            
            //sleep impact
            
            
            //stress levels impact
            
            
//RELATIONSHIPS VIEW CONTROLLER Functions
            //marital status impact
            
            
            //personal contact impact
            
            
            //heart attack impact
            
            
            //cancer impact
            
            
            //father impact
            
            
            //mother impact
            
            
            
//DIET AND NUTRITION VIEW CONTROLLER Functions
            //coffee impact
            
            
            //dairy impact
            
            
            //sweets impact
            
            
            //carbs impact
            
            
            //red meat impact
            
            
            //fast foods impact
            
            
            
//DRUGS AND ALCOHOL USE VIEW CONTROLLER Functions
            
            //smoking impact
            if (user.lifeSpecifications.isSmoking) {
                let agesToSubtract = LifeExpectancyCalculator.smokingImpact(lifeSpecs: user.lifeSpecifications)
                baseAge = baseAge - agesToSubtract
            }
            
            //second hand smoking impact
            
            
            //alcohol impact
            
            
            //illegal drugs impact
            
            
            
//OTHER HEALTH INFO VIEW CONTROLLER Functions
            
            //HDL levels impact
            
            
            //LDL levels impact
            
            
            //sunscreen impact
            
            
            //cancer screening impact
            
            
            //anxiety about death impact
            
            
        
        onCompletion(baseAge)
  
        }
    }
    
//CALCULATIONS FOR IMPACT
    
    
//GENERAL VIEW CONTROLLER Functions IMPACT CALCULATIONS (that are not part of the "base" age)
    
    //bmi impact
    
    
    //bmi high because of muscle or fat impact
    
    
    //education impact
    
    
    //diabetes impact
    
    
//YOUR DAILY LIFE VIEW CONTROLLER Functions
    //exercise impact
    
    //flossing impact
    
    //hours of work per week impact
    
    
    //days of work per week impact
    
    //air quality impact
    
    
    //seatbelt impact
    
    
    //sleep impact
    
    
    //stress levels impact
    
    
    
    
//RELATIONSHIPS VIEW CONTROLLER Functions
    //marital status impact
    
    
    //personal contact impact
    
    
    //heart attack impact
    
    
    //cancer impact
    
    
    //father impact
    
    
    //mother impact
    
    
//DIET AND NUTRITION VIEW CONTROLLER Functions
    //coffee impact
    
    
    //dairy impact
    
    
    //sweets impact
    
    
    //carbs impact
    
    
    //red meat impact
    
    
    //fast foods impact

    
    
//DRUGS AND ALCOHOL USE VIEW CONTROLLER Functions
    
    //smoking impact
    private static func smokingImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numCigarettesPerDay {
        case 0:
            return 1
        case 1:
            return 2
        case 2:
            return 3
        default:
            return 4
        }
        
    }
    //second hand smoking impact
    
    
    //alcohol impact
    
    
    //illegal drugs impact
    
    
    
//OTHER HEALTH INFO VIEW CONTROLLER Functions
    
    //HDL levels impact
    
    
    //LDL levels impact
    
    
    //sunscreen impact
    
    
    //cancer screening impact
    
    
    //anxiety about death impact
    

    
}
