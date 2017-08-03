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
    
//set default values here
    
    //GENERAL
    var dob: Date = Date()
    var sex: String = "male"
    var country: String = "United States"
    var height: Double = 60.0
    var weight: Double = 150.0
    var BMI: String = "normal"
    var whyBMI: String = "not high BMI"
    var educationLevel: String = "Currently in high school"
    var diabetes: String = "no"
    
    //DAILY LIFE
    
    var numExerciseDays: String = "three"
    var flossInfo: String = "no"
    var numWorkHours: String = "lessThanFortyHoursPerWeekOfWorkSelected"
    var numWorkDays: String = "fiveDaysOrLessWorkWeekSelected"
    var airQuality: String = "slightlyPollutedAirQualitySelected"
  //  var seatbeltInfo: String = "halfTimeSeatbeltSelected"
    var numSleepHours: String = "sevenToNineHoursSleepSelected"
    var stressLevels: String = "mediumStressLevelsSelected"
    var petOwner: String = "yes"
    
    
    //RELATIONSHIPS
    var maritalStatus: String = ""
    var personalContact: String = ""
    var heartAttack: String = "no"
    var cancerRun: String = "no"
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
    
    var isSmoking: Bool = true
    var numCigarettesPerDay: String = ""
    var secondHandSmoke: String = ""
    var drinkAlcohol: Bool = true
    var numNightsSpentDrinking: String = ""
    var numDrinksPerNight: String = ""
    var illegalDrugsInfo: String = ""
    
    //OTHER HEALTH INFO
    var hdlLevels: String = ""
    var ldlLevels: String = ""
    var sunProtectionInfo: String = ""
    var cancerScreeningInfo: String = ""
    var anxietyAboutDying: String = ""
    

}
