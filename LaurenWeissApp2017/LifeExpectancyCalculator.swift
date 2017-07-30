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
//            if (user.lifeSpecifications.isSmoking) {
//                let agesToSubtractBasedOnSmoking = LifeExpectancyCalculator.smokingImpact(lifeSpecs: user.lifeSpecifications)
//                baseAge = baseAge - agesToSubtractBasedOnSmoking
//            }
            
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
    private static func exerciseImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numExerciseDays {
        case "zero":
            return 1
        case "one":
            return 2
        case "two":
            return 3
        case "three":
            return 4
        case "four":
            return 5
        case "five":
            return 6
        case "six to seven":
            return 7
        default:
            return 0
        }
    }
    
    
    //flossing impact
    
    private static func flossingImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.flossInfo {
        case "yes":
            return 1
        case "no":
            return 2
        default:
            return 0
        }
    }

    
    //hours of work per week impact
    private static func numHoursWorkPerWeek(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numWorkHours {
        case "lessThanFortyHoursPerWeekOfWorkSelected":
            return 1
        case "fortyOneToSixtyHoursPerWeekOfWorkSelected":
            return 2
        case "sixtyOneToEightyHoursPerWeekOfWorkSelected":
            return 3
        case "moreThanEightyHoursPerWeekOfWorkSelected":
            return 4
        case "notWorkingAnyHoursPerWeekSelected":
            return 5
        case "retiredNotWorkingAnyHoursPerWeekSelected":
            return 6
        default:
            return 0
        }
    }
    
    //days of work per week impact
    
    private static func numDaysWorkPerWeek(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numWorkDays {
        case "fiveDaysOrLessWorkWeekSelected":
            return 1
        case "sixDayWorkWeekSelected":
            return 2
        case "sevenDayWorkWeekSelected":
            return 3
        case "notWorkingAnyDaysSelected":
            return 4
        case "retiredNotWorkingAnyDaysSelected":
            return 5
        default:
            return 0
        }
    }
    
    //air quality impact
    
    private static func airQuality(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.airQuality {
        case "veryCleanAirQualitySelected":
            return 1
        case "slightlyPollutedAirQualitySelected":
            return 2
        case "veryPollutedAirQualitySelected":
            return 3
        default:
            return 0
        }
    }
    
    
    //seatbelt impact
    private static func seatbeltImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.seatbeltInfo {
        case "alwaysWearSeatbeltSelected":
            return 1
        case "eightyPercentSeatbeltSelected":
            return 2
        case "halfTimeSeatbeltSelected":
            return 3
        case "lessThanHalfTimeSeatbeltSelected":
            return 3
        default:
            return 0
        }
    }
    
    //sleep impact
    private static func sleepImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numSleepHours {
        case "lessThanFiveHoursSleepSelected":
            return 1
        case "sixToSevenHoursSleepSelected":
            return 2
        case "sevenToNineHoursSleepSelected":
            return 3
        case "moreThanNineHoursSleepSelected":
            return 3
        default:
            return 0
        }
    }
    
    //stress levels impact
    private static func stressLevelsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.stressLevels {
        case "lowStressLevelsSelected":
            return 1
        case "mediumStressLevelsSelected":
            return 2
        case "highStressLevelsSelected":
            return 3
        default:
            return 0
        }
    }
    
    
    
//RELATIONSHIPS VIEW CONTROLLER Functions
    //marital status impact
    
    private static func maritalStatusImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.maritalStatus {
        case "single":
            return 1
        case "married":
            return 2
        case "widowed":
            return 3
        case "divorced":
            return 3
        case "too young to be married":
            return 4
        default:
            return 0
        }
    }
    
    
    //personal contact impact
    
    private static func personalContactImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.personalContact {
        case "rare personal contact":
            return 1
        case "contact few times per week":
            return 2
        case "contact more than few times per week":
            return 3
        default:
            return 0
        }
    }
    //heart attack impact
    private static func heartAttackImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.heartAttack {
        case "yes":
            return 1
        case "no":
            return 2
        default:
            return 0
        }
    }
    
    //cancer impact
    private static func cancerImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.cancerRun {
        case "yes":
            return 1
        case "no":
            return 2
        default:
            return 0
        }
    }
    
    //father impact
    private static func fatherImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.fatherDependency {
        case "dependent":
            return 1
        case "deceased":
            return 2
        case "independent":
            return 3
        default:
            return 0
        }
    }
    
    //mother impact
    private static func motherImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.motherDependency {
        case "dependent":
            return 1
        case "deceased":
            return 2
        case "independent":
            return 3
        default:
            return 0
        }
    }
    
//DIET AND NUTRITION VIEW CONTROLLER Functions
    //coffee impact
    private static func coffeeImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numCoffeeCups {
        case "none":
            return 1
        case "one to two cups":
            return 2
        case "two to three cups":
            return 3
        default:
            return 0
        }
    }
    
    //dairy impact
    private static func dairyImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.numDairy {
        case "zero to one":
            return 1
        case "two to three":
            return 2
        case "three or more":
            return 3
        default:
            return 0
        }
    }
    
    //sweets impact
    private static func sweetsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.sweetsInfo {
        case "rarely":
            return 1
        case "onetotwodaysperweek":
            return 2
        case "threetofivedaysperweek":
            return 3
        case "onceaday":
            return 3
        case "morethanonceaday":
            return 3
        default:
            return 0
        }
    }
    
    //carbs impact
    private static func carbsImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.carbsInfo {
        case "oneorfewerservings":
            return 1
        case "oneservingtwicepereek":
            return 2
        case "everyotherday":
            return 3
        case "onetotwoservings":
            return 3
        case "threeormore":
            return 3
        default:
            return 0
        }
    }
    
    
    //red meat impact
    private static func redMeatImpact(lifeSpecs: LifeSpecs) -> Double {
        
        switch lifeSpecs.redMeatInfo {
        case "noredmeat":
            return 1
        case "oneto2":
            return 2
        case "3to5":
            return 3
        case "6to7":
            return 3
        default:
            return 0
        }
    }
    
    //fast foods impact

    
    
//DRUGS AND ALCOHOL USE VIEW CONTROLLER Functions
    
    //smoking impact
//    private static func smokingImpact(lifeSpecs: LifeSpecs) -> Double {
//        
//        switch lifeSpecs.numCigarettesPerDay {
//        case 0:
//            return 1
//        case 1:
//            return 2
//        case 2:
//            return 3
//        default:
//            return 4
//        }
//        
//    }
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
