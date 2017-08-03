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
            baseAge = baseAge - agesToAddBasedOnEducation
            
            //diabetes impact
            let agesToSubtractBasedOnDiabetes = LifeExpectancyCalculator.diabetesImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - agesToSubtractBasedOnDiabetes
            
//YOUR DAILY LIFE VIEW CONTROLLER Functions
            //exercise impact
            let yearsToAddBasedOnExercise = LifeExpectancyCalculator.exerciseImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnExercise

            //flossing impact
            let yearsToAddBasedOnFlossing = LifeExpectancyCalculator.flossingImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnFlossing

            
            //hours of work per week impact
            let yearsToAddBasedOnWorkHours = LifeExpectancyCalculator.numHoursWorkPerWeek(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnWorkHours
            
            
            //days of work per week impact
            let yearsToAddBasedOnDaysWorkPerWeek = LifeExpectancyCalculator.numDaysWorkPerWeek(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnDaysWorkPerWeek
            //air quality impact
            let yearsToAddBasedOnAirQuality = LifeExpectancyCalculator.airQuality(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnAirQuality
            
            //seatbelt impact
//            let yearsToAddBasedOnSeatbelt = LifeExpectancyCalculator.seatbeltImpact(lifeSpecs: user.lifeSpecifications)
//            baseAge = baseAge + yearsToAddBasedOnSeatbelt
            
            //sleep impact
            let yearsToAddBasedOnSleep = LifeExpectancyCalculator.sleepImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnSleep
            
            //stress levels impact
            let yearsToAddBasedOnStress = LifeExpectancyCalculator.stressLevelsImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnStress
            
            //pet impact
            
            let yearsToAddBasedOnPet = LifeExpectancyCalculator.petImpact(lifeSpaces: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnPet
            
//RELATIONSHIPS VIEW CONTROLLER Functions
            //marital status impact
            let yearsToAddBasedOnMaritalStatus = LifeExpectancyCalculator.maritalStatusImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnMaritalStatus
            
            //personal contact impact
            let yearsToAddBasedOnContact = LifeExpectancyCalculator.personalContactImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnContact
            
            //heart attack impact
            let yearsToAddBasedOnHeart = LifeExpectancyCalculator.heartAttackImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnHeart
            
            //cancer impact
            let yearsToAddBasedOnCancer = LifeExpectancyCalculator.cancerImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnCancer
            
            //father impact
            let yearsToAddBasedOnFather = LifeExpectancyCalculator.fatherImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnFather
            
            //mother impact
            let yearsToAddBAsedOnMother = LifeExpectancyCalculator.motherImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBAsedOnMother
            
            
//DIET AND NUTRITION VIEW CONTROLLER Functions
            //coffee impact
            let yearsToAddBasedOnCoffee = LifeExpectancyCalculator.coffeeImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnCoffee
            
            //dairy impact
            let yearsToAddBasedOnDairy = LifeExpectancyCalculator.dairyImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnDairy
            
            //sweets impact
            let yearsToAddBasedOnSweets = LifeExpectancyCalculator.sweetsImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnSweets
            
            //carbs impact
            let yearsToAddBasedOnCarbs = LifeExpectancyCalculator.carbsImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnCarbs
            
            //red meat impact
            let yearsToAddBasedOnMeat = LifeExpectancyCalculator.redMeatImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnMeat
            
            //fast foods impact
            let yearsToAddBasedOnFAstFoods = LifeExpectancyCalculator.fastFoodsImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnFAstFoods
            
            
//DRUGS AND ALCOHOL USE VIEW CONTROLLER Functions
            
            //smoking impact
//            let yearsToAddBasedOnWhetherSmoking = LifeExpectancyCalculator.doYouSmoke(lifeSpecs: user.lifeSpecifications)
//            baseAge = baseAge + yearsToAddBasedOnWhetherSmoking
            
            let yearsToAddBasedOnNumCigs = LifeExpectancyCalculator.smokingImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - Double(yearsToAddBasedOnNumCigs)
            
            
            //second hand smoking impact
            let yearsToAddBasedOnSecondHandSmoke = LifeExpectancyCalculator.secondHandSmokingImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnSecondHandSmoke
            
            //alcohol impact
//            let yearsToAddBasedOnWhetherAlcohol = LifeExpectancyCalculator.doYouDrink(lifeSpecs: user.lifeSpecifications)
//            baseAge = baseAge + yearsToAddBasedOnWhetherAlcohol
            
            let yearsToAddBasedOnNumNightsSpentDrinking = LifeExpectancyCalculator.alcoholImpactNightsSpentDrinking(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnNumNightsSpentDrinking
            
            let yearsToAddBasedOnNumDrinksPerNight = LifeExpectancyCalculator.alcoholImpactNumDrinks(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnNumDrinksPerNight
            
            //illegal drugs impact
            let yearsToAddBasedOnDrugs = LifeExpectancyCalculator.drugsImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnDrugs
            
            
//OTHER HEALTH INFO VIEW CONTROLLER Functions
            
            //HDL levels impact
            let yearsToAddBasedonHDL = LifeExpectancyCalculator.hdlImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedonHDL
            
            //LDL levels impact
            let yearsToAddBasedOnLDL = LifeExpectancyCalculator.ldlImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnLDL
            
            //sunscreen impact
            let yearsToAddBasedOnSunscreen = LifeExpectancyCalculator.sunscreenImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBasedOnSunscreen
            
            //cancer screening impact
            let yearsToAddBasedOnCAncerScreening = LifeExpectancyCalculator.cancerScreeningImpact(lifeSpecs: user.lifeSpecifications);            baseAge = baseAge - yearsToAddBasedOnCAncerScreening
            
            //anxiety about death impact
            let yearsToAddBAsedOnAnxiety = LifeExpectancyCalculator.anxietyAboutDeathImpact(lifeSpecs: user.lifeSpecifications)
            baseAge = baseAge - yearsToAddBAsedOnAnxiety
            
        
        onCompletion(baseAge)
  
        }
    }
    
//CALCULATIONS FOR IMPACT
    
    
//GENERAL VIEW CONTROLLER Functions IMPACT CALCULATIONS (that are not part of the "base" age)
    
    //bmi impact
    //kind of correct calculations
     static func bmiImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.BMI {
        case "normal":
            return 0
        case "pre-obese":
            return 5
        case "obese":
            return 8
        case "underweight":
            return 1
        default:
            return 0
        }
        
    }
    
    //bmi high because of muscle or fat impact
    //kind of crrect calculations
     static func bmiBasedOnWhat(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.whyBMI {
        case "BMI high because of fat":
            return 0
        case "BMI high because of muscle":
            return 5
        case "not high BMI":
            return 0
        default:
            return 0
        }
        
    }
    
    //education impact
    //has correct calculations
     static func educationImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.educationLevel {
        case "Advanced degree":
            return -0.5
        case "College degree":
            return -0.5
        case "High school degree":
            return -0.5
        case "Some high school":
             return 0.5
        case "Currently in high school":
            return 0
        default:
            return 0
        }
        
    }
    
    //diabetes impact
    //correct calculations (averaged type I and type II)
     static func diabetesImpact(lifeSpecs: LifeSpecs) -> Double {
        switch lifeSpecs.diabetes {
        case "yes":
            return 15
        case "no":
            return 0
        default:
            return 0
        }
    }
    
    
//YOUR DAILY LIFE VIEW CONTROLLER Functions
    //exercise impact
    //correct calculations
     static func exerciseImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numExerciseDays {
        case "zero":
            return 7
        case "one":
            return 0
        case "two":
            return 0
        case "three":
            return -0.5
        case "four":
            return -1.5
        case "five":
            return -3
        case "six to seven":
            return -5
        default:
            return 0
        }
    }
    
    
    //flossing impact
    //correct calculations
     static func flossingImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.flossInfo {
        case "yes":
            return -1
        case "no":
            return 1
        default:
            return 0
        }
    }

    
    //hours of work per week impact
    //correct calculations
     static func numHoursWorkPerWeek(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numWorkHours {
        case "lessThanFortyHoursPerWeekOfWorkSelected":
            return -1
        case "fortyOneToSixtyHoursPerWeekOfWorkSelected":
            return 0.5
        case "sixtyOneToEightyHoursPerWeekOfWorkSelected":
            return 0.5
        case "moreThanEightyHoursPerWeekOfWorkSelected":
            return 1
        case "notWorkingAnyHoursPerWeekSelected":
            return 0
        case "retiredNotWorkingAnyHoursPerWeekSelected":
            return 0
        default:
            return 0
        }
    }
    
    //days of work per week impact
    //correct calculations
     static func numDaysWorkPerWeek(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numWorkDays {
        case "fiveDaysOrLessWorkWeekSelected":
            return -2
        case "sixDayWorkWeekSelected":
            return 1
        case "sevenDayWorkWeekSelected":
            return 2
        case "notWorkingAnyDaysSelected":
            return 0
        case "retiredNotWorkingAnyDaysSelected":
            return 0
        default:
            return 0
        }
    }
    
    //air quality impact
    //correct calculations
     static func airQuality(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.airQuality {
        case "veryCleanAirQualitySelected":
            return -0.5
        case "slightlyPollutedAirQualitySelected":
            return 0.25
        case "veryPollutedAirQualitySelected":
            return 0.5
        default:
            return 0
        }
    }
    
    
    //seatbelt impact
    //correct calculations
    //SEATBELT IS ACTUALLY PET INFO
//     static func seatbeltImpact(lifeSpecs: LifeSpecs) -> Double {
//        
//        switch lifeSpecs.seatbeltInfo {
//        case "yes":
//            return 2
//        case "no":
//            return 0
//        default:
//            return 0
//        }
//    }
    
    
    //pet ownership impact
    
    static func petImpact(lifeSpaces: LifeSpecs) -> Double {
        switch lifeSpaces.petOwner {
        case "yes":
            return -2
        case "no" :
            return 0
        default:
            return 0
        }
    }
    
    
    //sleep impact
    //kind of correct calculations
     static func sleepImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numSleepHours {
        case "lessThanFiveHoursSleepSelected":
            return 3
        case "sixToSevenHoursSleepSelected":
            return -1
        case "sevenToNineHoursSleepSelected":
            return -2
        case "moreThanNineHoursSleepSelected":
            return 1
        case "fiveToSixHoursSleepSelected":
            return 2.5
        default:
            return 0
        }
    }
    
    //stress levels impact
    //correct calculations
     static func stressLevelsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.stressLevels {
        case "lowStressLevelsSelected":
            return -0.75
        case "mediumStressLevelsSelected":
            return 0.5
        case "highStressLevelsSelected":
            return 0.75
        default:
            return 0
        }
    }
    
    
    
//RELATIONSHIPS VIEW CONTROLLER Functions
    //marital status impact
    //kind of correct calculations
     static func maritalStatusImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.maritalStatus {
        case "single":
            return 2
        case "married":
            return -7
        case "widowed":
            return 2
        case "divorced":
            return 3
        case "too young to be married":
            return 0
        default:
            return 0
        }
    }
    
    
    //personal contact impact
    //correct calculations
    
    static func personalContactImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.personalContact {
        case "rare personal contact":
            return 0.5
        case "contact few times per week":
            return -0.5
        case "contact more than few times per week":
            return -1
        default:
            return 0
        }
    }
    //heart attack impact
    //haven't implemented correct calculations yet
     static func heartAttackImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.heartAttack {
        case "yes":
            return 0
        case "no":
            return 0
        default:
            return 0
        }
    }
    
    //cancer impact
    //haven't implemented correct calculations yet
    
    static func cancerImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.cancerRun {
        case "yes":
            return 0
        case "no":
            return 0
        default:
            return 0
        }
    }
    
    //father impact
    //haven't implemented correct calculations yet
     static func fatherImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.fatherDependency {
        case "dependent":
            return 0
        case "deceased":
            return 0
        case "independent":
            return 0
        default:
            return 0
        }
    }
    
    //mother impact
    //haven't implemented correct calculations yet
     static func motherImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.motherDependency {
        case "dependent":
            return 0
        case "deceased":
            return 0
        case "independent":
            return 0
        default:
            return 0
        }
    }
    
//DIET AND NUTRITION VIEW CONTROLLER Functions
    //coffee impact
    //correct calculations
     static func coffeeImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numCoffeeCups {
        case "none":
            return -0.5
        case "one to two cups":
            return 0.5
        case "two to three cups":
            return 0.5
        default:
            return 0
        }
    }
    
    //dairy impact
    //kind of correct calculations
    
    static func dairyImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numDairy {
        case "zero to one":
            return 0.5
        case "two to three":
            return -0.5
        case "three or more":
            return -0.5
        default:
            return 0
        }
    }
    
    //sweets impact
    //kind of correct calculations
     static func sweetsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.sweetsInfo {
        case "rarely":
            return -2
        case "onetotwodaysperweek":
            return -0.5
        case "threetofivedaysperweek":
            return 0.5
        case "onceaday":
            return 1
        case "morethanonceaday":
            return 2
        default:
            return 0
        }
    }
    
    //carbs impact
    //guessed these calculations
     static func carbsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.carbsInfo {
        case "oneorfewerservings":
            return 0
        case "oneservingtwicepereek":
            return 0
        case "everyotherday":
            return 0
        case "onetotwoservings":
            return 0
        case "threeormore":
            return 0
        default:
            return 0
        }
    }
    
    
    //red meat impact
    //kind of correct calculations
     static func redMeatImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.redMeatInfo {
        case "noredmeat":
            return -1
        case "oneto2":
            return -1
        case "3to5":
            return 1
        case "6to7":
            return 3
        default:
            return 0
        }
    }
    
    //fast foods impact
    //i think these are the correct calculations
     static func fastFoodsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.fastFoodsInfo {
        case "none":
            return -1
        case "1to2":
            return 1
        case "3to4":
            return 4
        case "over5":
            return 8
        default:
            return 0
        }
    }
    
    
//DRUGS AND ALCOHOL USE VIEW CONTROLLER Functions
    
    //guessed on these calculations
    static func smokingImpact(lifeSpecs: LifeSpecs) -> Int {
        
        switch lifeSpecs.numCigarettesPerDay {
        case "oneCigToHalfAPack":
            return 10
        case "onePackCigPerDay":
            return 10
        case "oneAndAHalfPacksPerDay":
            return 15
        case "twoPacksPerDay":
            return 17
        case "threeOrMorePacksPerDay":
            return 22
        default:
            return 0
        }
        
    }
    //second hand smoking impact
    //guessed on these calculations
     static func secondHandSmokingImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.secondHandSmoke {
        case "dailySecondHand":
            return 7
        case "fewTimesPerWeekExposure":
            return 4
        case "oncePerWeekExposure":
            return 2
        case "neverExposure":
            return 0
        default:
            return 0
        }
        
    }
    
    //alcohol impact - do you drink
//    private static func doYouDrink(lifeSpecs: LifeSpecs) -> Boolean {
//        
//        switch lifeSpecs.drinkAlcohol {
//        case true:
//            return
//        case false:
//            return
//        default:
//            return
//        }
//        
//    }
    
    //Work on these calculations
    //HELP -depends on answer to next question
     static func alcoholImpactNightsSpentDrinking(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numNightsSpentDrinking {
        case "oneToTwoDaysDrinkingPerWeekSelected":
            return 0
        case "threeToFiveDaysDrinkingPerWeekSelected":
            return 0
        case "sixToSevenDaysDrinkningPerWeek":
            return 0
        default:
            return 0
        }
        
    }
    
    //Work on these calculations
    //HELP -depends on answer to previous question

     static func alcoholImpactNumDrinks(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numNightsSpentDrinking {
        case "oneToTwoDrinksPerNightSelected":
            return 0
        case "aboutThreeDrinksPerNightSelected":
            return 0
        case "atLeastThreeDrinksPerNightSelected":
            return 0
        default:
            return 0
        }
        
    }
    
    //illegal drugs impact
    //correct calculations
     static func drugsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.illegalDrugsInfo {
        case "neverDrugsSelected":
            return -1
        case "drugsFewTimesPerYearSelected":
            return 2
        case "drugsEveryFewMonthsSelected":
            return 10
        case "drugsOnceOrMorePerMonth":
            return 20
        case "drugsOncePerYear":
            return 1
        default:
            return 0
        }
        
    }
    
    
//OTHER HEALTH INFO VIEW CONTROLLER Functions
    
    //HDL levels impact
    //correct calculations
     static func hdlImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.hdlLevels {
        case "low":
            return 1
        case "medium":
            return -1
        case "high":
            return -1
        case "unknown":
            return 0
        default:
            return 0
        }
        
    }
    
    //LDL levels impact
    //correct calculations
     static func ldlImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.ldlLevels {
        case "low":
            return -1
        case "medium":
            return -1
        case "high":
            return 1
        case "unknown":
            return 0
        default:
            return 0
        }
        
    }
    
    //sunscreen impact
    //correct calculations
     static func sunscreenImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.sunProtectionInfo {
        case "alwaysSunscreenSelected":
            return -1
        case "mostOfTheTimeSunscreen":
            return -0.5
        case "sometimesSunscreen":
            return 0.5
        case "rarelySunscreenSelected":
            return 1
        default:
            return 0
        }
        
    }
    
    //cancer screening impact
    //correct calculations
     static func cancerScreeningImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.cancerScreeningInfo {
        case "noCancerScreeningSelected":
            return 1
        case "yesCancerScreeningSelected":
            return -1
        default:
            return 0
        }
        
    }
    
    //anxiety about death impact
    //correct calculations
     static func anxietyAboutDeathImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.anxietyAboutDying {
        case "yesAnxietyDeath":
            return 2
        case "noAnxietyDeath":
            return -1
        default:
            return 0
        }
        
    }
    
}
