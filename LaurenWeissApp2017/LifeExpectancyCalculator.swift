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
            
//MARK: - GENERAL VIEW CONTROLLER Functions (that are not part of the "base" age)
    
            //bmi impact
            let agesToSubtractBasedOnBMI = LifeExpectancyCalculator.bmiImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - agesToSubtractBasedOnBMI

            
            //bmi high because of muscle or fat impact
            let agesToSubstractBasedOnMuscleFatBMI = LifeExpectancyCalculator.bmiBasedOnWhat(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - agesToSubstractBasedOnMuscleFatBMI
            
            //education impact
            let agesToAddBasedOnEducation = LifeExpectancyCalculator.educationImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge + agesToAddBasedOnEducation
            
            //diabetes impact
            let agesToSubtractBasedOnDiabetes = LifeExpectancyCalculator.diabetesImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - agesToSubtractBasedOnDiabetes
            
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
                let agesToSubtractBasedOnSmoking = LifeExpectancyCalculator.smokingImpact(lifeSpecs: user.lifeSpecifications)
                baseAge = baseAge - agesToSubtractBasedOnSmoking
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
    //haven't implemented correct calculations yet
    private static func bmiImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.BMI {
        case "normal":
            return 1
        case "pre-obese":
            return 2
        case "obese":
            return 3
        case "underweight":
            return 4
        default:
            return 0
        }
        
    }
    
    //bmi high because of muscle or fat impact
    //haven't implemented correct calculations yet
    private static func bmiBasedOnWhat(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.whyBMI {
        case "BMI high because of fat":
            return 1
        case "BMI high because of muscle":
            return 2
        case "not high BMI":
            return 3
        default:
            return 0
        }
        
    }
    
    //education impact
    //has correct calculations
    private static func educationImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.educationLevel {
        case "Advanced degree":
            return 0.5
        case "College degree":
            return 0.5
        case "High school degree":
            return 0.5
        case "Some high school":
             return -0.5
        case "Currently in high school":
            return 0
        default:
            return 0
        }
        
    }
    
    //diabetes impact
    //haven't implemented correct calculations yet
    private static func diabetesImpact(lifeSpecs: LifeSpecs) -> Double {
        switch lifeSpecs.diabetes {
        case "yes":
            return 1
        case "no":
            return 2
        default:
            return 0
        }
        
    }
    
    
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
