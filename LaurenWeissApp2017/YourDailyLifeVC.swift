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
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //stress levels function
    func stressLevels() {
        if lowStressLevels.isSelected {
            lowStressLevels.isEnabled = true
            lowStressLevels.backgroundColor = UIColor.green
        }
        if mediumStressLevels.isSelected {
            mediumStressLevels.isEnabled = true
            mediumStressLevels.backgroundColor = UIColor.green
        }
        if highStressLevels.isSelected {
            highStressLevels.isEnabled = true
            highStressLevels.backgroundColor = UIColor.green
        }
    }
    
    //exercise info function
    func selectExercise() {
        if zeroExerciseDaysPerWeek.isSelected {
        zeroExerciseDaysPerWeek.isEnabled = true
        zeroExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
        if oneExerciseDayPerWeek.isSelected {
            oneExerciseDayPerWeek.isEnabled = true
            oneExerciseDayPerWeek.backgroundColor = UIColor.green
        }
        if twoExerciseDaysPerWeek.isSelected {
            twoExerciseDaysPerWeek.isEnabled = true
            twoExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
        if threeExerciseDaysPerWeek.isSelected {
            threeExerciseDaysPerWeek.isEnabled = true
            threeExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
        if fourExerciseDaysPerWeek.isSelected {
            fourExerciseDaysPerWeek.isEnabled = true
            fourExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
        if fiveExerciseDaysPerWeek.isSelected {
            fiveExerciseDaysPerWeek.isEnabled = true
            fiveExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
        if sixToSevenExerciseDaysPerWeek.isSelected {
            sixToSevenExerciseDaysPerWeek.isEnabled = true
            sixToSevenExerciseDaysPerWeek.backgroundColor = UIColor.green
        }
       
    }
    
    
    //sleep info function
    func selectSleep() {
        if lessThanFiveHoursSleep.isSelected {
            lessThanFiveHoursSleep.isEnabled = true
            lessThanFiveHoursSleep.backgroundColor = UIColor.green
        }
        if sixToSevenHoursSleep.isSelected {
            sixToSevenHoursSleep.isEnabled = true
            sixToSevenHoursSleep.backgroundColor = UIColor.green
        }
        if sevenToNineHoursSleep.isSelected {
            sevenToNineHoursSleep.isEnabled = true
            sevenToNineHoursSleep.backgroundColor = UIColor.green
        }
        if moreThanNineHoursSleep.isSelected {
            moreThanNineHoursSleep.isEnabled = true
            moreThanNineHoursSleep.backgroundColor = UIColor.green
        }
        
    }
    
    
    //flossing info
    func selectFlossing() {
        if yesFloss.isSelected {
            yesFloss.isEnabled = true
            yesFloss.backgroundColor = UIColor.green
        }
        if noFloss.isSelected {
            noFloss.isEnabled = true
            noFloss.backgroundColor = UIColor.green
        }
    
    }
    
    //job info
        ////number of days spend working out of the week function
    func numDaysSpentWorking() {
        if fiveOrLessWorkingDaysPerWeek.isSelected {
            fiveOrLessWorkingDaysPerWeek.isEnabled = true
            fiveOrLessWorkingDaysPerWeek.backgroundColor = UIColor.green
        }
        if sixWorkingDaysPerWeek.isSelected {
            sixWorkingDaysPerWeek.isEnabled = true
            sixWorkingDaysPerWeek.backgroundColor = UIColor.green
        }
        if sevenWorkingDaysPerWeek.isSelected {
            sevenWorkingDaysPerWeek.isEnabled = true
            sevenWorkingDaysPerWeek.backgroundColor = UIColor.green
        }
        if notWorkingAnyDaysPerWeek.isSelected {
            notWorkingAnyDaysPerWeek.isEnabled = true
            notWorkingAnyDaysPerWeek.backgroundColor = UIColor.green
        }
        if retiredNotWorkingAnyDaysPerWeek.isSelected {
            retiredNotWorkingAnyDaysPerWeek.isEnabled = true
            retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.green
        }

    }
    
    //hours spent working per week
    func hoursSpentWorking() {
        if lessThan40HoursPerWeek.isSelected {
            lessThan40HoursPerWeek.isEnabled = true
            lessThan40HoursPerWeek.backgroundColor = UIColor.green
        }
        if about41to60HoursPerWeek.isSelected {
            about41to60HoursPerWeek.isEnabled = true
            about41to60HoursPerWeek.backgroundColor = UIColor.green
        }
        if about61to80HoursPerWeek.isSelected {
            about61to80HoursPerWeek.isEnabled = true
            about61to80HoursPerWeek.backgroundColor = UIColor.green
        }
        if moreThan80HoursPerWeek.isSelected {
            moreThan80HoursPerWeek.isEnabled = true
            moreThan80HoursPerWeek.backgroundColor = UIColor.green
        }
        if notWorkingAnyHoursPerWeek.isSelected {
            notWorkingAnyHoursPerWeek.isEnabled = true
            notWorkingAnyHoursPerWeek.backgroundColor = UIColor.green
        }
        if retiredNotWorkingAnyDaysPerWeek.isSelected {
            retiredNotWorkingAnyDaysPerWeek.isEnabled = true
            retiredNotWorkingAnyDaysPerWeek.backgroundColor = UIColor.green
        }
    }
    
    //air quality selector function
    func airQualityInfo() {
        if veryCleanAir.isSelected {
            veryCleanAir.isEnabled = true
            veryCleanAir.backgroundColor = UIColor.green
        }
        if slightlyPollutedAir.isSelected {
            slightlyPollutedAir.isEnabled = true
            slightlyPollutedAir.backgroundColor = UIColor.green
        }
        if veryPollutedAir.isSelected {
            veryPollutedAir.isEnabled = true
            veryPollutedAir.backgroundColor = UIColor.green
        }
    }
    
    
    //seatbelt selector function
    func seatbeltInfo() {
        if alwaysSeatbelt.isSelected {
            alwaysSeatbelt.isEnabled = true
            alwaysSeatbelt.backgroundColor = UIColor.green
        }
        if eightyPercentSeatbelt.isSelected {
            eightyPercentSeatbelt.isEnabled = true
            eightyPercentSeatbelt.backgroundColor = UIColor.green
        }
        if halfTimeSeatbelt.isSelected {
            halfTimeSeatbelt.isEnabled = true
            halfTimeSeatbelt.backgroundColor = UIColor.green
        }
        if lessThanHalfSeatbelt.isSelected {
            lessThanHalfSeatbelt.isEnabled = true
            lessThanHalfSeatbelt.backgroundColor = UIColor.green
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeathDate" {
//            User.current.lifeSpecifications?.dob = datePicker.date
//            User.current.lifeSpecifications?.sex = selectGender()
            //pass your age from lifeSpecs to destination
            //your destination has a container for that ready
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = User.current.finalAge
            }
        }
    }
    
}
