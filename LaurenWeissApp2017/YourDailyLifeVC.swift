//
//  YourDailyLifeVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class YourDailyLifeVC: UIViewController, UIScrollViewDelegate {
    
    //stress levels info
    
    @IBOutlet weak var lowStressLevels: UIButton!
    @IBOutlet weak var mediumStressLevels: UIButton!
    @IBOutlet weak var highStressLevels: UIButton!
    
    //exercise info
    
    @IBOutlet weak var zeroExerciseDaysPerWeek: UIButton!
    @IBOutlet weak var oneExerciseDayPerWeek: UIButton!
    @IBOutlet weak var twoExerciseDaysPerWeek: UIButton!
    @IBOutlet weak var threeExerciseDaysPerWeek: UIButton!
    @IBOutlet weak var fourExerciseDaysPerWeek: UIButton!
    @IBOutlet weak var fiveExerciseDaysPerWeek: UIButton!
    @IBOutlet weak var sixToSevenExerciseDaysPerWeek: UIButton!
    
    //sleep info

    @IBOutlet weak var lessThanFiveHoursSleep: UIButton!
    @IBOutlet weak var sixToSevenHoursSleep: UIButton!
    @IBOutlet weak var sevenToNineHoursSleep: UIButton!
    @IBOutlet weak var moreThanNineHoursSleep: UIButton!
    
    //flossing info
    
    @IBOutlet weak var yesFloss: UIButton!
    @IBOutlet weak var noFloss: UIButton!
    
    //job info
    
        //number of days spend working out of the week
    @IBOutlet weak var fiveOrLessWorkingDaysPerWeek: UIButton!
    @IBOutlet weak var sixWorkingDaysPerWeek: UIButton!
    @IBOutlet weak var sevenWorkingDaysPerWeek: UIButton!
    @IBOutlet weak var notWorkingAnyDaysPerWeek: UIButton!
    @IBOutlet weak var retiredNotWorkingAnyDaysPerWeek: UIButton!
        //hours spent working per week
    @IBOutlet weak var lessThan40HoursPerWeek: UIButton!
    @IBOutlet weak var about41to60HoursPerWeek: UIButton!
    @IBOutlet weak var about61to80HoursPerWeek: UIButton!
    @IBOutlet weak var moreThan80HoursPerWeek: UIButton!
    @IBOutlet weak var notWorkingAnyHoursPerWeek: UIButton!
    @IBOutlet weak var retiredNotWorkingAnyHoursPerWeek: UIButton!
    
    //air quality info
    
    @IBOutlet weak var veryCleanAir: UIButton!
    @IBOutlet weak var slightlyPollutedAir: UIButton!
    @IBOutlet weak var veryPollutedAir: UIButton!
    
    //seatbelt info
    
//    @IBOutlet weak var alwaysSeatbelt: UIButton!
//    @IBOutlet weak var eightyPercentSeatbelt: UIButton!
//    @IBOutlet weak var halfTimeSeatbelt: UIButton!
//    @IBOutlet weak var lessThanHalfSeatbelt: UIButton!
    
    
    //pet info
    @IBOutlet weak var yesPetOwner: UIButton!
    @IBOutlet weak var notAPetOwner: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.backgroundColor = UIColor.primaryBlue

        
        calculateButton.layer.cornerRadius = 10

        //Calling Functions: SELECT EXERCISE
        if LifeSpecs.lifeSpecifications.numExerciseDays == "zero" {
            zeroExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "one" {
            oneExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "two" {
            twoExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "three" {
            threeExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "four" {
            fourExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "five" {
            fiveExerciseDaysPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numExerciseDays == "six to seven" {
            sixToSevenExerciseDaysPerWeekSelected()
        }
        
        //Calling Functions: SELECT FLOSS
        if LifeSpecs.lifeSpecifications.flossInfo == "yes" {
            yesFlossSelected()
        } else if LifeSpecs.lifeSpecifications.flossInfo == "no" {
            noFlossSelected()
        }
        
        //Calling Functions: SELECT HOW MANY HOURS YOU WORK PER WEEK
        if LifeSpecs.lifeSpecifications.numWorkHours == "lessThanFortyHoursPerWeekOfWorkSelected" {
            lessThanFortyHoursPerWeekOfWorkSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkHours == "fortyOneToSixtyHoursPerWeekOfWorkSelected" {
            fortyOneToSixtyHoursPerWeekOfWorkSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkHours == "sixtyOneToEightyHoursPerWeekOfWorkSelected" {
            sixtyOneToEightyHoursPerWeekOfWorkSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkHours == "moreThanEightyHoursPerWeekOfWorkSelected" {
            moreThanEightyHoursPerWeekOfWorkSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkHours == "notWorkingAnyHoursPerWeekSelected" {
            notWorkingAnyHoursPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkHours == "retiredNotWorkingAnyHoursPerWeekSelected" {
            retiredNotWorkingAnyHoursPerWeekSelected()
        }
        
        
        //Calling Functions: SELECT HOW MANY WORK DAYS YOU HAVE PER WEEK
        if LifeSpecs.lifeSpecifications.numWorkDays == "fiveDaysOrLessWorkWeekSelected" {
            fiveDaysOrLessWorkWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkDays == "sixDayWorkWeekSelected" {
            sixDayWorkWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkDays == "sevenDayWorkWeekSelected" {
            sevenDayWorkWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkDays == "notWorkingAnyDaysSelected" {
            notWorkingAnyDaysSelected()
        } else if LifeSpecs.lifeSpecifications.numWorkDays == "retiredNotWorkingAnyDaysSelected" {
            retiredNotWorkingAnyDaysSelected()
        }
        
        //Calling Functions: SELECT AIR QUALITY
        if LifeSpecs.lifeSpecifications.airQuality == "veryCleanAirQualitySelected" {
            veryCleanAirQualitySelected()
        } else if LifeSpecs.lifeSpecifications.airQuality == "slightlyPollutedAirQualitySelected" {
            slightlyPollutedAirQualitySelected()
        } else if LifeSpecs.lifeSpecifications.airQuality == "veryPollutedAirQualitySelected" {
            veryPollutedAirQualitySelected()
        }
        
        //Calling Functions: SELECT SEATBELT SAFETY
//        if LifeSpecs.lifeSpecifications.seatbeltInfo == "alwaysWearSeatbeltSelected" {
//            alwaysWearSeatbeltSelected()
//        } else if LifeSpecs.lifeSpecifications.seatbeltInfo == "eightyPercentSeatbeltSelected" {
//            eightyPercentSeatbeltSelected()
//        } else if LifeSpecs.lifeSpecifications.seatbeltInfo == "halfTimeSeatbeltSelected" {
//            halfTimeSeatbeltSelected()
//        } else if LifeSpecs.lifeSpecifications.seatbeltInfo == "lessThanHalfTimeSeatbeltSelected" {
//            lessThanHalfTimeSeatbeltSelected()
//        }
//        
        //Calling Functions: SELECT SLEEP HOURS
        if LifeSpecs.lifeSpecifications.numSleepHours == "lessThanFiveHoursSleepSelected" {
            lessThanFiveHoursSleepSelected()
        } else if LifeSpecs.lifeSpecifications.numSleepHours == "sixToSevenHoursSleepSelected" {
            sixToSevenHoursSleepSelected()
        } else if LifeSpecs.lifeSpecifications.numSleepHours == "sevenToNineHoursSleepSelected" {
            sevenToNineHoursSleepSelected()
        } else if LifeSpecs.lifeSpecifications.numSleepHours == "moreThanNineHoursSleepSelected" {
            moreThanNineHoursSleepSelected()
        }
        
        //Calling Functions: SELECT STRESS LEVELS
        if LifeSpecs.lifeSpecifications.stressLevels == "lowStressLevelsSelected" {
            lowStressLevelsSelected()
        } else if LifeSpecs.lifeSpecifications.stressLevels == "mediumStressLevelsSelected" {
            mediumStressLevelsSelected()
        } else if LifeSpecs.lifeSpecifications.stressLevels == "highStressLevelsSelected" {
            highStressLevelsSelected()
        }
        
        //Calling Functions: Select pet ownership status
        if LifeSpecs.lifeSpecifications.petOwner == "no" {
            notAPetOwnerSelected()
        } else if LifeSpecs.lifeSpecifications.petOwner == "yes" {
        
            yesPetOwnerSelected()
        }
        
        //making buttons have rounded corners
       
        lowStressLevels.layer.cornerRadius = 10
        mediumStressLevels.layer.cornerRadius = 10
        highStressLevels.layer.cornerRadius = 10
        zeroExerciseDaysPerWeek.layer.cornerRadius = 10
        oneExerciseDayPerWeek.layer.cornerRadius = 10
        twoExerciseDaysPerWeek.layer.cornerRadius = 10
        threeExerciseDaysPerWeek.layer.cornerRadius = 10
        fourExerciseDaysPerWeek.layer.cornerRadius = 10
        fiveExerciseDaysPerWeek.layer.cornerRadius = 10
        sixToSevenExerciseDaysPerWeek.layer.cornerRadius = 10
        lessThanFiveHoursSleep.layer.cornerRadius = 10
        sixToSevenHoursSleep.layer.cornerRadius = 10
        sevenToNineHoursSleep.layer.cornerRadius = 10
        moreThanNineHoursSleep.layer.cornerRadius = 10
        yesFloss.layer.cornerRadius = 10
        noFloss.layer.cornerRadius = 10
        fiveOrLessWorkingDaysPerWeek.layer.cornerRadius = 10
        sixWorkingDaysPerWeek.layer.cornerRadius = 10
        sevenWorkingDaysPerWeek.layer.cornerRadius = 10
        notWorkingAnyDaysPerWeek.layer.cornerRadius = 10
        retiredNotWorkingAnyDaysPerWeek.layer.cornerRadius = 10
        lessThan40HoursPerWeek.layer.cornerRadius = 10
        about41to60HoursPerWeek.layer.cornerRadius = 10
        about61to80HoursPerWeek.layer.cornerRadius = 10
        moreThan80HoursPerWeek.layer.cornerRadius = 10
        notWorkingAnyHoursPerWeek.layer.cornerRadius = 10
        retiredNotWorkingAnyHoursPerWeek.layer.cornerRadius = 10
        veryCleanAir.layer.cornerRadius = 10
        slightlyPollutedAir.layer.cornerRadius = 10
        veryPollutedAir.layer.cornerRadius = 10
        yesPetOwner.layer.cornerRadius = 10
        notAPetOwner.layer.cornerRadius = 10
//        alwaysSeatbelt.layer.cornerRadius = 10
//        eightyPercentSeatbelt.layer.cornerRadius = 10
//       halfTimeSeatbelt.layer.cornerRadius = 10
//        lessThanHalfSeatbelt.layer.cornerRadius = 10
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let lauren = DispatchGroup()
        lauren.enter()
        
        LifeExpectancyCalculator.calculateAge() { (finalAge) in
            LifeSpecs.lifeSpecifications.finalAge = Double(finalAge)
            lauren.leave()
        }
        
        lauren.notify(queue: .main) {
            print("done")
            self.performSegue(withIdentifier: "toDeathDate", sender: nil)
        }
    }
    
    
    //pet owner info functions
    
    @IBAction func selectPetOwnership(_ sender: UIButton) {
        if sender.tag == 100 {
            yesPetOwnerSelected()
        } else if sender.tag == 200 {
            notAPetOwnerSelected()
        }
    }
    
    func yesPetOwnerSelected() {
        yesPetOwner.backgroundColor = UIColor.primaryBlue
        yesPetOwner.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.petOwner = "yes"
        
        notAPetOwner.setTitleColor(UIColor.primaryBlue, for: .normal)
        notAPetOwner.backgroundColor = UIColor.clear
    }
    func notAPetOwnerSelected() {
        notAPetOwner.backgroundColor = UIColor.primaryBlue
        notAPetOwner.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.petOwner = "no"
        
        yesPetOwner.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesPetOwner.backgroundColor = UIColor.clear
    }
    
    
    //exercise info functions
    
    @IBAction func selectExercse(_ sender: UIButton) {
        if sender.tag == 100 {
            zeroExerciseDaysPerWeekSelected()
        } else if sender.tag == 101 {
            oneExerciseDaysPerWeekSelected()
        } else if sender.tag == 102 {
            twoExerciseDaysPerWeekSelected()
        } else if sender.tag == 103 {
            threeExerciseDaysPerWeekSelected()
        } else if sender.tag == 104 {
            fourExerciseDaysPerWeekSelected()
        } else if sender.tag == 105 {
            fiveExerciseDaysPerWeekSelected()
        } else if sender.tag == 106 {
            sixToSevenExerciseDaysPerWeekSelected()
        }
    }
    
    
    func zeroExerciseDaysPerWeekSelected() {
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "zero"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func oneExerciseDaysPerWeekSelected() {
        oneExerciseDayPerWeek.backgroundColor = UIColor.primaryBlue
        oneExerciseDayPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "one"
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func twoExerciseDaysPerWeekSelected() {
        twoExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        twoExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "two"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func threeExerciseDaysPerWeekSelected() {
        threeExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        threeExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "three"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func fourExerciseDaysPerWeekSelected() {
        fourExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        fourExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "four"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func fiveExerciseDaysPerWeekSelected() {
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "five"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }
    func sixToSevenExerciseDaysPerWeekSelected() {
        sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.primaryBlue
        sixToSevenExerciseDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numExerciseDays = "six to seven"
        
        oneExerciseDayPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneExerciseDayPerWeek.backgroundColor = UIColor.clear
        
        twoExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        threeExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fourExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fourExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
        zeroExerciseDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.clear
        
    }

    //flossing info functions
    
    @IBAction func selectFloss(_ sender: UIButton) {
        if sender.tag == 1 {
            yesFlossSelected()
        } else if sender.tag == 2 {
            noFlossSelected()
        }
    }
    
    func yesFlossSelected() {
        yesFloss.backgroundColor = UIColor.primaryBlue
        yesFloss.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.flossInfo = "yes"
        
        noFloss.setTitleColor(UIColor.primaryBlue, for: .normal)
        noFloss.backgroundColor = UIColor.clear
        
    }
    func noFlossSelected() {
        noFloss.backgroundColor = UIColor.primaryBlue
        noFloss.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.flossInfo = "no"
        
        yesFloss.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesFloss.backgroundColor = UIColor.clear
    }
    
    
    //number of hours spent working info functions
    
    @IBAction func selectNumHoursWorkPerWeek(_ sender: UIButton) {
        if sender.tag == 1 {
            lessThanFortyHoursPerWeekOfWorkSelected()
        } else if sender.tag == 2 {
            fortyOneToSixtyHoursPerWeekOfWorkSelected()
        } else if sender.tag == 3 {
            sixtyOneToEightyHoursPerWeekOfWorkSelected()
        } else if sender.tag == 4 {
            moreThanEightyHoursPerWeekOfWorkSelected()
        } else if sender.tag == 5 {
            notWorkingAnyHoursPerWeekSelected()
        } else if sender.tag == 6 {
            retiredNotWorkingAnyHoursPerWeekSelected()
        }
        
    }
    
    
    func lessThanFortyHoursPerWeekOfWorkSelected() {
        lessThan40HoursPerWeek.backgroundColor = UIColor.primaryBlue
        lessThan40HoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "lessThanFortyHoursPerWeekOfWorkSelected"
        
        about41to60HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about41to60HoursPerWeek.backgroundColor = UIColor.clear
        
        about61to80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about61to80HoursPerWeek.backgroundColor = UIColor.clear
        
        moreThan80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThan80HoursPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
    }
    func fortyOneToSixtyHoursPerWeekOfWorkSelected() {
        about41to60HoursPerWeek.backgroundColor = UIColor.primaryBlue
        about41to60HoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "fortyOneToSixtyHoursPerWeekOfWorkSelected"
        
        lessThan40HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThan40HoursPerWeek.backgroundColor = UIColor.clear
        
        about61to80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about61to80HoursPerWeek.backgroundColor = UIColor.clear
        
        moreThan80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThan80HoursPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
    }
    func sixtyOneToEightyHoursPerWeekOfWorkSelected() {
        about61to80HoursPerWeek.backgroundColor = UIColor.primaryBlue
        about61to80HoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "sixtyOneToEightyHoursPerWeekOfWorkSelected"
        
        about41to60HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about41to60HoursPerWeek.backgroundColor = UIColor.clear
        
        lessThan40HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThan40HoursPerWeek.backgroundColor = UIColor.clear
        
        moreThan80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThan80HoursPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
    }
    func moreThanEightyHoursPerWeekOfWorkSelected() {
        moreThan80HoursPerWeek.backgroundColor = UIColor.primaryBlue
        moreThan80HoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "moreThanEightyHoursPerWeekOfWorkSelected"
        
        about41to60HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about41to60HoursPerWeek.backgroundColor = UIColor.clear
        
        about61to80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about61to80HoursPerWeek.backgroundColor = UIColor.clear
        
        lessThan40HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThan40HoursPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
    }
    func notWorkingAnyHoursPerWeekSelected() {
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.primaryBlue
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "notWorkingAnyHoursPerWeekSelected"
        
        about41to60HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about41to60HoursPerWeek.backgroundColor = UIColor.clear
        
        about61to80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about61to80HoursPerWeek.backgroundColor = UIColor.clear
        
        moreThan80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThan80HoursPerWeek.backgroundColor = UIColor.clear
        
        lessThan40HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThan40HoursPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
    }
    func retiredNotWorkingAnyHoursPerWeekSelected() {
        retiredNotWorkingAnyHoursPerWeek.backgroundColor = UIColor.primaryBlue
        retiredNotWorkingAnyHoursPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkHours = "retiredNotWorkingAnyHoursPerWeekSelected"
        
        about41to60HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about41to60HoursPerWeek.backgroundColor = UIColor.clear
        
        about61to80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        about61to80HoursPerWeek.backgroundColor = UIColor.clear
        
        moreThan80HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThan80HoursPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyHoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyHoursPerWeek.backgroundColor = UIColor.clear
        
        lessThan40HoursPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThan40HoursPerWeek.backgroundColor = UIColor.clear
        
    }
    
    
    //number of days out of the week spent working
    
    @IBAction func numDaysSpentWorkingPerWeek(_ sender: UIButton) {
        if sender.tag == 1 {
            fiveDaysOrLessWorkWeekSelected()
        } else if sender.tag == 2 {
            sixDayWorkWeekSelected()
        } else if sender.tag == 3 {
            sevenDayWorkWeekSelected()
        } else if sender.tag == 4 {
            notWorkingAnyDaysSelected()
        } else if sender.tag == 5 {
            retiredNotWorkingAnyDaysSelected()
        }
    }
    
    
    func fiveDaysOrLessWorkWeekSelected() {
        fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.primaryBlue
        fiveOrLessWorkingDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkDays = "fiveDaysOrLessWorkWeekSelected"
        
        sixWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        sevenWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        

    }
    func sixDayWorkWeekSelected() {
        
        sixWorkingDaysPerWeek.backgroundColor = UIColor.primaryBlue
        sixWorkingDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkDays = "sixDayWorkWeekSelected"
        
        fiveOrLessWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        sevenWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        
    }
    func sevenDayWorkWeekSelected() {
        
        sevenWorkingDaysPerWeek.backgroundColor = UIColor.primaryBlue
        sevenWorkingDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkDays = "sevenDayWorkWeekSelected"
        
        sixWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveOrLessWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        
    }
    func notWorkingAnyDaysSelected() {
        
        notWorkingAnyDaysPerWeek.backgroundColor = UIColor.primaryBlue
        notWorkingAnyDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkDays = "notWorkingAnyDaysSelected"
        
        sixWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        sevenWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveOrLessWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        retiredNotWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        
    }
    func retiredNotWorkingAnyDaysSelected() {
        
        retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.primaryBlue
        retiredNotWorkingAnyDaysPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numWorkDays = "retiredNotWorkingAnyDaysSelected"
        
        sixWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        sevenWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
        notWorkingAnyDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        notWorkingAnyDaysPerWeek.backgroundColor = UIColor.clear
        
        fiveOrLessWorkingDaysPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.clear
        
    
    }
    
    //air quality functions
    
    
    @IBAction func airQuality(_ sender: UIButton) {
        if sender.tag == 0 {
            veryCleanAirQualitySelected()
        } else if sender.tag == 1 {
            slightlyPollutedAirQualitySelected()
        } else if sender.tag == 2 {
            veryPollutedAirQualitySelected()
        }
    }
    
    func veryCleanAirQualitySelected() {
        veryCleanAir.backgroundColor = UIColor.primaryBlue
        veryCleanAir.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.airQuality = "veryCleanAirQualitySelected"
        
        slightlyPollutedAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        slightlyPollutedAir.backgroundColor = UIColor.clear
        
        veryPollutedAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        veryPollutedAir.backgroundColor = UIColor.clear
        
        
    }
    func slightlyPollutedAirQualitySelected() {
        slightlyPollutedAir.backgroundColor = UIColor.primaryBlue
        slightlyPollutedAir.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.airQuality = "slightlyPollutedAirQualitySelected"
        
        veryCleanAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        veryCleanAir.backgroundColor = UIColor.clear
        
        veryPollutedAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        veryPollutedAir.backgroundColor = UIColor.clear
        
    }
    func veryPollutedAirQualitySelected() {
        veryPollutedAir.backgroundColor = UIColor.primaryBlue
        veryPollutedAir.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.airQuality = "veryPollutedAirQualitySelected"
        
        slightlyPollutedAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        slightlyPollutedAir.backgroundColor = UIColor.clear
        
        veryCleanAir.setTitleColor(UIColor.primaryBlue, for: .normal)
        veryCleanAir.backgroundColor = UIColor.clear
        
    }
    
    //seatbelt info functions
    
//    
//    @IBAction func seatbeltInfo(_ sender: UIButton) {
//        if sender.tag == 0 {
//            alwaysWearSeatbeltSelected()
//        } else if sender.tag == 1 {
//            eightyPercentSeatbeltSelected()
//        } else if sender.tag == 2 {
//            halfTimeSeatbeltSelected()
//        } else if sender.tag == 3 {
//            lessThanHalfTimeSeatbeltSelected()
//        }
//    }
//    
//    func alwaysWearSeatbeltSelected() {
//        alwaysSeatbelt.backgroundColor = UIColor.primaryBlue
//        alwaysSeatbelt.setTitleColor(UIColor.white, for: .normal)
//        LifeSpecs.lifeSpecifications.seatbeltInfo = "alwaysWearSeatbeltSelected"
//        
//        eightyPercentSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        eightyPercentSeatbelt.backgroundColor = UIColor.clear
//        
//        halfTimeSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        halfTimeSeatbelt.backgroundColor = UIColor.clear
//        
//        lessThanHalfSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        lessThanHalfSeatbelt.backgroundColor = UIColor.clear
//    }
//    func eightyPercentSeatbeltSelected() {
//        eightyPercentSeatbelt.backgroundColor = UIColor.primaryBlue
//        eightyPercentSeatbelt.setTitleColor(UIColor.white, for: .normal)
//        LifeSpecs.lifeSpecifications.seatbeltInfo = "eightyPercentSeatbeltSelected"
//        
//        alwaysSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        alwaysSeatbelt.backgroundColor = UIColor.clear
//        
//        halfTimeSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        halfTimeSeatbelt.backgroundColor = UIColor.clear
//        
//        lessThanHalfSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        lessThanHalfSeatbelt.backgroundColor = UIColor.clear
//    }
//    func halfTimeSeatbeltSelected() {
////        halfTimeSeatbelt.backgroundColor = UIColor.primaryBlue
////        halfTimeSeatbelt.setTitleColor(UIColor.white, for: .normal)
//        LifeSpecs.lifeSpecifications.seatbeltInfo = "halfTimeSeatbeltSelected"
//        
//        alwaysSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        alwaysSeatbelt.backgroundColor = UIColor.clear
//        
//        eightyPercentSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        eightyPercentSeatbelt.backgroundColor = UIColor.clear
//        
//        lessThanHalfSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        lessThanHalfSeatbelt.backgroundColor = UIColor.clear
//        
//    }
//    func lessThanHalfTimeSeatbeltSelected() {
//        lessThanHalfSeatbelt.backgroundColor = UIColor.primaryBlue
//        lessThanHalfSeatbelt.setTitleColor(UIColor.white, for: .normal)
//        LifeSpecs.lifeSpecifications.seatbeltInfo = "lessThanHalfTimeSeatbeltSelected"
//        
//        alwaysSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        alwaysSeatbelt.backgroundColor = UIColor.clear
//        
//        eightyPercentSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        eightyPercentSeatbelt.backgroundColor = UIColor.clear
//        
//        halfTimeSeatbelt.setTitleColor(UIColor.primaryBlue, for: .normal)
//        halfTimeSeatbelt.backgroundColor = UIColor.clear
//        
//    }
    
    //hours of sleep per night info functions
    
    @IBAction func numHoursSleep(_ sender: UIButton) {
        if sender.tag == 0 {
            lessThanFiveHoursSleepSelected()
        } else if sender.tag == 1 {
            sixToSevenHoursSleepSelected()
        } else if sender.tag == 2 {
            sevenToNineHoursSleepSelected()
        } else if sender.tag == 3 {
            moreThanNineHoursSleepSelected()
        }
    }
    func lessThanFiveHoursSleepSelected() {
        lessThanFiveHoursSleep.backgroundColor = UIColor.primaryBlue
        lessThanFiveHoursSleep.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numSleepHours = "lessThanFiveHoursSleepSelected"
        
        sixToSevenHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenHoursSleep.backgroundColor = UIColor.clear
        
        sevenToNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenToNineHoursSleep.backgroundColor = UIColor.clear
        
        moreThanNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanNineHoursSleep.backgroundColor = UIColor.clear
        
    }
    func sixToSevenHoursSleepSelected() {
        sixToSevenHoursSleep.backgroundColor = UIColor.primaryBlue
        sixToSevenHoursSleep.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numSleepHours = "sixToSevenHoursSleepSelected"
        
        lessThanFiveHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThanFiveHoursSleep.backgroundColor = UIColor.clear
        
        sevenToNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenToNineHoursSleep.backgroundColor = UIColor.clear
        
        moreThanNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanNineHoursSleep.backgroundColor = UIColor.clear
        
    }
    func sevenToNineHoursSleepSelected() {
        sevenToNineHoursSleep.backgroundColor = UIColor.primaryBlue
        sevenToNineHoursSleep.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numSleepHours = "sevenToNineHoursSleepSelected"
        
        lessThanFiveHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThanFiveHoursSleep.backgroundColor = UIColor.clear
        
        sixToSevenHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenHoursSleep.backgroundColor = UIColor.clear
        
        moreThanNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanNineHoursSleep.backgroundColor = UIColor.clear
        
    }
    func moreThanNineHoursSleepSelected() {
        moreThanNineHoursSleep.backgroundColor = UIColor.primaryBlue
        moreThanNineHoursSleep.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numSleepHours = "moreThanNineHoursSleepSelected"
        
        lessThanFiveHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        lessThanFiveHoursSleep.backgroundColor = UIColor.clear
        
        sixToSevenHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenHoursSleep.backgroundColor = UIColor.clear
        
        sevenToNineHoursSleep.setTitleColor(UIColor.primaryBlue, for: .normal)
        sevenToNineHoursSleep.backgroundColor = UIColor.clear
        
    }
    
    //stress levels info functions
    
    @IBAction func stressLevelsInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            lowStressLevelsSelected()
        } else if sender.tag == 1 {
            mediumStressLevelsSelected()
        } else if sender.tag == 2 {
            highStressLevelsSelected()
        }
    }
    func lowStressLevelsSelected() {
        lowStressLevels.backgroundColor = UIColor.primaryBlue
        lowStressLevels.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.stressLevels = "lowStressLevelsSelected"
        
        mediumStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumStressLevels.backgroundColor = UIColor.clear
        
        highStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        highStressLevels.backgroundColor = UIColor.clear
        
    }
    func mediumStressLevelsSelected() {
        mediumStressLevels.backgroundColor = UIColor.primaryBlue
        mediumStressLevels.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.stressLevels = "mediumStressLevelsSelected"
        
        lowStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowStressLevels.backgroundColor = UIColor.clear
        
        highStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        highStressLevels.backgroundColor = UIColor.clear
        
    }
    func highStressLevelsSelected() {
        highStressLevels.backgroundColor = UIColor.primaryBlue
        highStressLevels.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.stressLevels = "highStressLevels"
        
        lowStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowStressLevels.backgroundColor = UIColor.clear
        
        mediumStressLevels.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumStressLevels.backgroundColor = UIColor.clear
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "toDeathDate" {
        
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = LifeSpecs.lifeSpecifications.finalAge
            }
        }
    }
}
