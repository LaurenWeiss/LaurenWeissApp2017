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
    
    var finalAge = 0.0
    
//set default values here
    
    //GENERAL
    var dob: Date = Date()
    var sex: String = "male"
    var country: String = "United States"
    var height: Double = 60.0
    var weight: Double = 150.0
    var BMI: String = "normal"
    var whyBMI: String = "not high BMI"
    var educationLevel: String = ""
    var diabetes: String = ""
    
    //DAILY LIFE
    
    var numExerciseDays: String = ""
    var flossInfo: String = ""
    var numWorkHours: String = ""
    var numWorkDays: String = ""
    var airQuality: String = ""
  //  var seatbeltInfo: String = "halfTimeSeatbeltSelected"
    var numSleepHours: String = ""
    var stressLevels: String = ""
    var petOwner: String = ""
    
    
    //RELATIONSHIPS
    var maritalStatus: String = ""
    var personalContact: String = ""
    var heartAttack: String = ""
    var cancerRun: String = ""
    var fatherDependency: String = ""
    var motherDependency: String = ""
    
    //DIET/NUTRITION
    var numCoffeeCups: String = ""
    var numDairy: String = ""
    var sweetsInfo: String = ""
    var carbsInfo: String = ""
    var redMeatInfo: String = ""
    var fastFoodsInfo: String = ""
    
    //DRUGS/ALCOHOL
    
    var isSmoking: Bool?
    var numCigarettesPerDay: String = ""
    var secondHandSmoke: String = ""
    var drinkAlcohol: Bool?
    var numNightsSpentDrinking: String = ""
    var numDrinksPerNight: String = ""
    var illegalDrugsInfo: String = ""
    
    //OTHER HEALTH INFO
    var hdlLevels: String = ""
    var ldlLevels: String = ""
    var sunProtectionInfo: String = ""
    var cancerScreeningInfo: String = ""
    var anxietyAboutDying: String = ""
    

    private static var singleton: LifeSpecs?

    static var lifeSpecifications: LifeSpecs {
        guard let singleton = singleton else {
            fatalError("Error: current user doesn't exist")
        }

        return singleton
    }
    
    static func setGlobalLifeSpecs(lifeSpecs: LifeSpecs) {
        singleton = lifeSpecs
    }

}
