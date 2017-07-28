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
    
    @IBOutlet weak var alwaysSeatbelt: UIButton!
    @IBOutlet weak var eightyPercentSeatbelt: UIButton!
    @IBOutlet weak var halfTimeSeatbelt: UIButton!
    @IBOutlet weak var lessThanHalfSeatbelt: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling Functions: SELECT GENDER
        if User.current.lifeSpecifications.numExerciseDays == "zero" {
            zeroExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "one" {
            oneExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "two" {
            twoExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "three" {
            threeExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "four" {
            fourExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "five" {
            fiveExerciseDaysPerWeekSelected()
        } else if User.current.lifeSpecifications.numExerciseDays == "six to seven" {
            sixToSevenExerciseDaysPerWeekSelected()
        }
        
        //Calling Functions: SELECT FLOSS
        if User.current.lifeSpecifications.flossInfo == "yes" {
            yesFlossSelected()
        } else if User.current.lifeSpecifications.flossInfo == "no" {
            noFlossSelected()
        }
        
        //Calling Functions: SELECT HOW MANY HOURS YOU WORK PER WEEK
        if User.current.lifeSpecifications.numWorkHours == "lessThanFortyHoursPerWeekOfWorkSelected" {
            lessThanFortyHoursPerWeekOfWorkSelected()
        } else if User.current.lifeSpecifications.numWorkHours == "fortyOneToSixtyHoursPerWeekOfWorkSelected" {
            fortyOneToSixtyHoursPerWeekOfWorkSelected()
        } else if User.current.lifeSpecifications.numWorkHours == "sixtyOneToEightyHoursPerWeekOfWorkSelected" {
            sixtyOneToEightyHoursPerWeekOfWorkSelected()
        } else if User.current.lifeSpecifications.numWorkHours == "moreThanEightyHoursPerWeekOfWorkSelected" {
            moreThanEightyHoursPerWeekOfWorkSelected()
        } else if User.current.lifeSpecifications.numWorkHours == "notWorkingAnyHoursPerWeekSelected" {
            notWorkingAnyHoursPerWeekSelected()
        } else if User.current.lifeSpecifications.numWorkHours == "retiredNotWorkingAnyHoursPerWeekSelected" {
            retiredNotWorkingAnyHoursPerWeekSelected()
        }
        
        
        //Calling Functions: SELECT HOW MANY WORK DAYS YOU HAVE PER WEEK
        if User.current.lifeSpecifications.numWorkDays == "fiveDaysOrLessWorkWeekSelected" {
            fiveDaysOrLessWorkWeekSelected()
        } else if User.current.lifeSpecifications.numWorkDays == "sixDayWorkWeekSelected" {
            sixDayWorkWeekSelected()
        } else if User.current.lifeSpecifications.numWorkDays == "sevenDayWorkWeekSelected" {
            sevenDayWorkWeekSelected()
        } else if User.current.lifeSpecifications.numWorkDays == "notWorkingAnyDaysSelected" {
            notWorkingAnyDaysSelected()
        } else if User.current.lifeSpecifications.numWorkDays == "retiredNotWorkingAnyDaysSelected" {
            retiredNotWorkingAnyDaysSelected()
        }
        
        //Calling Functions: SELECT AIR QUALITY
        if User.current.lifeSpecifications.airQuality == "veryCleanAirQualitySelected" {
            veryCleanAirQualitySelected()
        } else if User.current.lifeSpecifications.airQuality == "slightlyPollutedAirQualitySelected" {
            slightlyPollutedAirQualitySelected()
        } else if User.current.lifeSpecifications.airQuality == "veryPollutedAirQualitySelected" {
            veryPollutedAirQualitySelected()
        }
        
        //Calling Functions: SELECT SEATBELT SAFETY
        if User.current.lifeSpecifications.seatbeltInfo == "alwaysWearSeatbeltSelected" {
            alwaysWearSeatbeltSelected()
        } else if User.current.lifeSpecifications.seatbeltInfo == "eightyPercentSeatbeltSelected" {
            eightyPercentSeatbeltSelected()
        } else if User.current.lifeSpecifications.seatbeltInfo == "halfTimeSeatbeltSelected" {
            halfTimeSeatbeltSelected()
        } else if User.current.lifeSpecifications.seatbeltInfo == "lessThanHalfTimeSeatbeltSelected" {
            lessThanHalfTimeSeatbeltSelected()
        }
        
        //Calling Functions: SELECT SLEEP HOURS
        if User.current.lifeSpecifications.numSleepHours == "lessThanFiveHoursSleepSelected" {
            lessThanFiveHoursSleepSelected()
        } else if User.current.lifeSpecifications.numSleepHours == "sixToSevenHoursSleepSelected" {
            sixToSevenHoursSleepSelected()
        } else if User.current.lifeSpecifications.numSleepHours == "sevenToNineHoursSleepSelected" {
            sevenToNineHoursSleepSelected()
        } else if User.current.lifeSpecifications.numSleepHours == "moreThanNineHoursSleepSelected" {
            moreThanNineHoursSleepSelected()
        }
        
        //Calling Functions: SELECT STRESS LEVELS
        if User.current.lifeSpecifications.stressLevels == "lowStressLevelsSelected" {
            lowStressLevelsSelected()
        } else if User.current.lifeSpecifications.stressLevels == "mediumStressLevelsSelected" {
            mediumStressLevelsSelected()
        } else if User.current.lifeSpecifications.stressLevels == "highStressLevelsSelected" {
            highStressLevelsSelected()
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
        alwaysSeatbelt.layer.cornerRadius = 10
        eightyPercentSeatbelt.layer.cornerRadius = 10
        halfTimeSeatbelt.layer.cornerRadius = 10
        lessThanHalfSeatbelt.layer.cornerRadius = 10
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let lauren = DispatchGroup()
        lauren.enter()
        
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
            lauren.leave()
        }
        
        lauren.notify(queue: .main) {
            print("done")
            self.performSegue(withIdentifier: "toDeathDate", sender: nil)
        }
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
        
    }
    func oneExerciseDaysPerWeekSelected() {
        
    }
    func twoExerciseDaysPerWeekSelected() {
        
    }
    func threeExerciseDaysPerWeekSelected() {
        
    }
    func fourExerciseDaysPerWeekSelected() {
        
    }
    func fiveExerciseDaysPerWeekSelected() {
        
    }
    func sixToSevenExerciseDaysPerWeekSelected() {
        
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
        
    }
    func noFlossSelected() {
        
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
        
    }
    func fortyOneToSixtyHoursPerWeekOfWorkSelected() {
        
    }
    func sixtyOneToEightyHoursPerWeekOfWorkSelected() {
        
    }
    func moreThanEightyHoursPerWeekOfWorkSelected() {
        
    }
    func notWorkingAnyHoursPerWeekSelected() {
        
    }
    func retiredNotWorkingAnyHoursPerWeekSelected() {
        
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
        
    }
    func sixDayWorkWeekSelected() {
        
    }
    func sevenDayWorkWeekSelected() {
        
    }
    func notWorkingAnyDaysSelected() {
        
    }
    func retiredNotWorkingAnyDaysSelected() {
    
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
        
    }
    func slightlyPollutedAirQualitySelected() {
        
    }
    func veryPollutedAirQualitySelected() {
        
    }
    
    //seatbelt info functions
    
    
    @IBAction func seatbeltInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            alwaysWearSeatbeltSelected()
        } else if sender.tag == 1 {
            eightyPercentSeatbeltSelected()
        } else if sender.tag == 2 {
            halfTimeSeatbeltSelected()
        } else if sender.tag == 3 {
            lessThanHalfTimeSeatbeltSelected()
        }
    }
    
    func alwaysWearSeatbeltSelected() {
        
    }
    func eightyPercentSeatbeltSelected() {
        
    }
    func halfTimeSeatbeltSelected() {
        
    }
    func lessThanHalfTimeSeatbeltSelected() {
        
    }
    
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
        
    }
    func sixToSevenHoursSleepSelected() {
        
    }
    func sevenToNineHoursSleepSelected() {
        
    }
    func moreThanNineHoursSleepSelected() {
        
    }
    
    //stress levels info functions
    
    @IBAction func stressLevelsInfo(_ sender: UIButton) {
    }
    func lowStressLevelsSelected() {
        
    }
    func mediumStressLevelsSelected() {
        
    }
    func highStressLevelsSelected() {
        
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "toDeathDate" {
        
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = User.current.finalAge
            }
        }
    }
}
