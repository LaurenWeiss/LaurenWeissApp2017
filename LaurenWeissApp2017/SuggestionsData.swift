//
//  Suggestions Data.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/31/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation

class SuggestionsData {
    
    static var suggestions = [String: String]()
    static var suggestionsArray = [String]()
    
    static func prepareSuggestions() {
        
        
        //GIVE SUGGESTIONS BASED ON EDUCATION LEVEL
        
        switch User.current.lifeSpecifications.educationLevel {
        case "Some high school":
            let yearsToAdd = LifeExpectancyCalculator.educationImpact(lifeSpecs: User.current.lifeSpecifications) * -1
            suggestions["education"] = "If you go back to school, you will add \(yearsToAdd) years to your life!"
        default:
            suggestions.removeValue(forKey: "education")
        }
        
        
        //GIVE SUGGESTIONS BASED ON BMI
        
        
        //GIVE SUGGESTIONS BASED ON EXERCISE
        
        
        //GIVE SUGGESTIONS BASED ON FLOSSING
        
        
        //GIVE SUGGESTIONS BASED ON NUMBER OF HOURS USER WORKS PER WEEK
        
        //GIVE SUGGESTIONS BASED ON NUMBER OF DAYS USER WORKS PER WEEK
        
        //GIVE SUGGESTIONS BASED ON AIR QUALITY WHERE USER LIVES
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER WEARS SEATBELT
        
        
        //GIVE SUGGESTIONS BASED ON SLEEP
        
        //GIVE SUGGESTIONS BASED ON STRESS LEVELS
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER RECEIVES PERSONAL CONTACT FROM FAMILY MEMBERS
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER HAS COFFEE
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS DAIRY
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS CANDY
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER HAS CARBS
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS RED MEAT
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER EATS FAST FOODS
        
        //GIVE SUGGESTIONS BASED ON WHETHER OR NOT USER SMOKES
        
        if User.current.lifeSpecifications.isSmoking {
            let yearsToAdd = LifeExpectancyCalculator.smokingImpact(lifeSpecs: User.current.lifeSpecifications) * -1
            suggestions["smoking"] = "If you quit smoking, you will add \(yearsToAdd) years to your life!"
        } else {
            suggestions.removeValue(forKey: "smoking")
        }
        
        //GIVE SUGGESTIONS BASED ON HOW MANY CIGS USER SMOKES
        
     
        
        //GIVE SUGGESTIONS BASED ON SECOND HAND SMOKING
        
        //GIVE SUGGESTIONS BASED ON HOW MANY NIGHTS PER WEEK USER SPENDS DRINKING
        
        
        //GIVE SUGGESTIONS BASED ON HOW MANY DRINKS USER HAS PER NIGHT
        
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER INJECTS ILLEGAL DRUGS
        
        
        //GIVE SUGGESTIONS BASED ON CHOLESTEROL LEVELS (GOOD LEVELS)
        
        //GIVE SUGGESTIONS BASED ON CHOLESTEROL LEVELS (BAD LEVELS)
        
        //GIVE SUGGESTIONS BASED ON HOW OFTEN USER IS SCREENED FOR CANCER
        
        //
        
        
        
        
        suggestionsArray.removeAll()
        prepareArray()
    }

    static func prepareArray() {
        
        for (_, value) in suggestions {
            suggestionsArray.append(value)
        }
    }
}
