//
//  DrugAlcoholUseVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class DrugAlcoholUseVC: UIViewController, UIScrollViewDelegate {
    
//smoking info
    @IBOutlet weak var yesSmoke: UIButton!
    @IBOutlet weak var noSmoke: UIButton!
    
    @IBOutlet weak var oneCigToHalfPack: UIButton!
    @IBOutlet weak var onePackSmoke: UIButton!
    @IBOutlet weak var twoPacksSmoke: UIButton!
    @IBOutlet weak var oneAndHalfPacksSmoke: UIButton!
    @IBOutlet weak var threeOrMorePacksSmoke: UIButton!
    
    @IBOutlet weak var dailySecondHandSmoke: UIButton!
    @IBOutlet weak var neverSecondHandSmoke: UIButton!
    @IBOutlet weak var onceAWeekSecondHandSmoke: UIButton!
    @IBOutlet weak var fewTimesWeekSecondHandSmoke: UIButton!
    @IBOutlet weak var smokingQuestionLabel: UILabel!
    
//alcohol info
    
    @IBOutlet weak var yesAlcohol: UIButton!
    @IBOutlet weak var noAlcohol: UIButton!
    
    
    @IBOutlet weak var sixToSevenDaysDrinkingPerWeek: UIButton!
    @IBOutlet weak var threeToFiveDaysDrinkingPerWeek: UIButton!
    @IBOutlet weak var oneToTwoDaysDrinkingPerWeek: UIButton!
    
    @IBOutlet weak var oneToTwoDrinksPerNight: UIButton!
    
    @IBOutlet weak var atLeastThreeDrinksPerNight: UIButton!
    @IBOutlet weak var aboutThreeDrinksPerNight: UIButton!
    
    
    @IBOutlet weak var alcoholQuestionLabel1: UILabel!
    
    @IBOutlet weak var alcoholQuestionLabel2: UILabel!
    
    
//drugs info
    @IBOutlet weak var neverDrugs: UIButton!
    @IBOutlet weak var drugsOncePerYear: UIButton!
    @IBOutlet weak var drugsFewTimesPerYear: UIButton!
    @IBOutlet weak var drugsOnceMorePerMonth: UIButton!
    @IBOutlet weak var drugsEveryFewMonths: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        fewTimesWeekSecondHandSmoke.titleLabel?.textAlignment = .center
        fewTimesWeekSecondHandSmoke.titleLabel?.numberOfLines = 0
        
        onceAWeekSecondHandSmoke.titleLabel?.textAlignment = .center
        onceAWeekSecondHandSmoke.titleLabel?.numberOfLines = 0
        
        
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.backgroundColor = UIColor.primaryBlue

        
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.setTitleColor(UIColor.gray, for: .disabled)
        
        
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.setTitleColor(UIColor.gray, for: .disabled)
        
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        
        //making the buttons have rounded corners
        
        yesSmoke.layer.cornerRadius = 10
        noSmoke.layer.cornerRadius = 10
        
        oneCigToHalfPack.layer.cornerRadius = 10
        onePackSmoke.layer.cornerRadius = 10
        twoPacksSmoke.layer.cornerRadius = 10
        oneAndHalfPacksSmoke.layer.cornerRadius = 10
        threeOrMorePacksSmoke.layer.cornerRadius = 10
        
        dailySecondHandSmoke.layer.cornerRadius = 10
        neverSecondHandSmoke.layer.cornerRadius = 10
        onceAWeekSecondHandSmoke.layer.cornerRadius = 10
        fewTimesWeekSecondHandSmoke.layer.cornerRadius = 10
        
        yesAlcohol.layer.cornerRadius = 10
        noAlcohol.layer.cornerRadius = 10
        
        sixToSevenDaysDrinkingPerWeek.layer.cornerRadius = 10
        threeToFiveDaysDrinkingPerWeek.layer.cornerRadius = 10
        oneToTwoDaysDrinkingPerWeek.layer.cornerRadius = 10
        
        oneToTwoDrinksPerNight.layer.cornerRadius = 10
        atLeastThreeDrinksPerNight.layer.cornerRadius = 10
        aboutThreeDrinksPerNight.layer.cornerRadius = 10
        
        neverDrugs.layer.cornerRadius = 10
        drugsOncePerYear.layer.cornerRadius = 10
        drugsFewTimesPerYear.layer.cornerRadius = 10
        drugsOnceMorePerMonth.layer.cornerRadius = 10
        drugsEveryFewMonths.layer.cornerRadius = 10
        
        
        
        
        //Calling Functions: SELECT WHETHER OR NOT YOU SMOKE
        
        if LifeSpecs.lifeSpecifications.isSmoking == true {
            yesSmokeSelected()
        } else if LifeSpecs.lifeSpecifications.isSmoking == false {
            noSmokeSelected()
            
            smokingQuestionLabel.textColor = UIColor.gray

        

        }
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.setTitleColor(UIColor.gray, for: .disabled)
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.setTitleColor(UIColor.gray, for: .disabled)
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.setTitleColor(UIColor.gray, for: .disabled)
        
        
        
        if LifeSpecs.lifeSpecifications.drinkAlcohol == true {
            yesAlcoholSelected()
        } else if LifeSpecs.lifeSpecifications.isSmoking == false {
            noAlcoholSelected()
            alcoholQuestionLabel1.textColor = UIColor.gray
            alcoholQuestionLabel2.textColor = UIColor.gray
                    }
        oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.gray, for: .disabled)
        threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.gray, for: .disabled)
        sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.gray, for: .disabled)
        oneToTwoDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDrinksPerNight.setTitleColor(UIColor.gray, for: .disabled)
        aboutThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        aboutThreeDrinksPerNight.setTitleColor(UIColor.gray, for: .disabled)
        atLeastThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        atLeastThreeDrinksPerNight.setTitleColor(UIColor.gray, for: .disabled)
        
        
        //Calling Functions: SELECT NUMBER OF CIGARETTE PACKS SMOKED PER DAY
        
        
        
        if LifeSpecs.lifeSpecifications.numCigarettesPerDay == "oneCigToHalfAPack" {
            oneCigToHalfAPack()
        } else if LifeSpecs.lifeSpecifications.numCigarettesPerDay == "onePackCigPerDay" {
            onePackCigPerDay()
        } else if LifeSpecs.lifeSpecifications.numCigarettesPerDay == "oneAndAHalfPacksPerDay" {
            oneAndAHalfPacksPerDay()
        } else if LifeSpecs.lifeSpecifications.numCigarettesPerDay == "twoPacksPerDay" {
            twoPacksPerDay()
        } else if LifeSpecs.lifeSpecifications.numCigarettesPerDay == "threeOrMorePacksPerDay" {
            threeOrMorePacksPerDay()
        }
        
        
        //Calling Functions: SELECT SECOND-HAND SMOKING EXPOSURE
        if LifeSpecs.lifeSpecifications.secondHandSmoke == "dailySecondHand" {
            dailySecondHand()
        } else if LifeSpecs.lifeSpecifications.secondHandSmoke == "fewTimesPerWeekExposure" {
            fewTimesPerWeekExposure()
        } else if LifeSpecs.lifeSpecifications.secondHandSmoke == "oncePerWeekExposure" {
            oncePerWeekExposure()
        } else if LifeSpecs.lifeSpecifications.secondHandSmoke == "neverExposure" {
            neverExposure()
        }
        //Calling Functions: SELECT WHETHER OR NOT YOU DRINK ALCOHOL
        if LifeSpecs.lifeSpecifications.drinkAlcohol == true {
            yesAlcoholSelected()
        } else if LifeSpecs.lifeSpecifications.drinkAlcohol == false {
            noAlcoholSelected()
        }
        //Calling Functions: SELECT NUM NIGHTS SPENT DRINKING
        if LifeSpecs.lifeSpecifications.numNightsSpentDrinking == "oneToTwoDaysDrinkingPerWeekSelected" {
            oneToTwoDaysDrinkingPerWeekSelected()
        } else if LifeSpecs.lifeSpecifications.numNightsSpentDrinking == "threeToFiveDaysDrinkingPerWeekSelected" {
            threeToFiveDaysDrinkingPerWeekSelected()
        }  else if LifeSpecs.lifeSpecifications.numNightsSpentDrinking == "sixToSevenDaysDrinkningPerWeek" {
            sixToSevenDaysDrinkningPerWeek()
        }
        
        //Calling Functions: SELECT HOW NUM DRINKS YOU HAVE IN ONE NIGHT OF DRINKING ALCOHOL
        if LifeSpecs.lifeSpecifications.numDrinksPerNight == "oneToTwoDrinksPerNightSelected" {
            oneToTwoDrinksPerNightSelected()
        } else if LifeSpecs.lifeSpecifications.numDrinksPerNight == "aboutThreeDrinksPerNightSelected" {
            aboutThreeDrinksPerNightSelected()
        }  else if LifeSpecs.lifeSpecifications.numDrinksPerNight == "atLeastThreeDrinksPerNightSelected" {
            atLeastThreeDrinksPerNightSelected()
        }
        //Calling Functions: SELECT WHETHER OR NOT YOU TAKE ILLEGAL DRUGS
        if LifeSpecs.lifeSpecifications.illegalDrugsInfo == "neverDrugsSelected" {
            neverDrugsSelected()
        } else if LifeSpecs.lifeSpecifications.illegalDrugsInfo == "drugsFewTimesPerYearSelected" {
            drugsFewTimesPerYearSelected()
        }  else if LifeSpecs.lifeSpecifications.illegalDrugsInfo == "drugsEveryFewMonthsSelected" {
            drugsEveryFewMonthsSelected()
        } else if LifeSpecs.lifeSpecifications.illegalDrugsInfo == "drugsOnceOrMorePerMonth" {
            drugsOnceOrMorePerMonth()
        } else if LifeSpecs.lifeSpecifications.illegalDrugsInfo == "drugsOncePerYear" {
            drugsOncePerYearS()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.navigationBar.isTranslucent = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.isTranslucent = false
        
    }
    //do you smoke
    @IBAction func selectWhetherOrNotSmoke(_ sender: UIButton) {
        if sender.tag == 0 {
            yesSmokeSelected()
            oneCigToHalfPack.isEnabled = true
            oneAndHalfPacksSmoke.isEnabled = true
            threeOrMorePacksSmoke.isEnabled = true
            onePackSmoke.isEnabled = true
            twoPacksSmoke.isEnabled = true
            smokingQuestionLabel.textColor = UIColor.primaryTextDark
            
            oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
            oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
            threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
            onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
            twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)

            
            
        } else if sender.tag == 1 {
            noSmokeSelected()
            oneCigToHalfPack.isEnabled = false
            oneAndHalfPacksSmoke.isEnabled = false
            threeOrMorePacksSmoke.isEnabled = false
            twoPacksSmoke.isEnabled = false
            onePackSmoke.isEnabled = false
            smokingQuestionLabel.textColor = UIColor.gray
          //  oneCigToHalfPack.textColor = UIColor.primaryTextDark
            oneCigToHalfPack.backgroundColor = UIColor.white
            oneAndHalfPacksSmoke.backgroundColor = UIColor.white
            threeOrMorePacksSmoke.backgroundColor = UIColor.white
            twoPacksSmoke.backgroundColor = UIColor.white
            onePackSmoke.backgroundColor = UIColor.white
            
            
        }
    }
    
    func yesSmokeSelected() {
        yesSmoke.backgroundColor = UIColor.primaryBlue
        yesSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.isSmoking = true
        
        noSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        noSmoke.backgroundColor = UIColor.clear
    }
    func noSmokeSelected() {
        noSmoke.backgroundColor = UIColor.primaryBlue
        noSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.isSmoking = false
        
        yesSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesSmoke.backgroundColor = UIColor.clear
    }
    
    //how many packs of cigs per day
    
    @IBAction func selectNumCigs(_ sender: UIButton) {
        if sender.tag == 0 {
            oneCigToHalfAPack()
        } else if sender.tag == 1 {
            onePackCigPerDay()
        } else if sender.tag == 2 {
            oneAndAHalfPacksPerDay()
        } else if sender.tag == 3 {
            twoPacksPerDay()
        } else if sender.tag == 4 {
            threeOrMorePacksPerDay()
        }

    }
    
    func oneCigToHalfAPack() {
        oneCigToHalfPack.backgroundColor = UIColor.primaryBlue
        oneCigToHalfPack.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numCigarettesPerDay = "oneCigToHalfAPack"
        
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.backgroundColor = UIColor.clear
        
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.backgroundColor = UIColor.clear
        
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.backgroundColor = UIColor.clear
        
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.backgroundColor = UIColor.clear
        
    }
    func onePackCigPerDay() {
        
        onePackSmoke.backgroundColor = UIColor.primaryBlue
        onePackSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numCigarettesPerDay = "onePackCigPerDay"
        
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.backgroundColor = UIColor.clear
        
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.backgroundColor = UIColor.clear
        
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.backgroundColor = UIColor.clear
        
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.backgroundColor = UIColor.clear
        
    }
    func oneAndAHalfPacksPerDay() {
        
        oneAndHalfPacksSmoke.backgroundColor = UIColor.primaryBlue
        oneAndHalfPacksSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numCigarettesPerDay = "oneAndAHalfPacksPerDay"
        
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.backgroundColor = UIColor.clear
        
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.backgroundColor = UIColor.clear
        
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.backgroundColor = UIColor.clear
        
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.backgroundColor = UIColor.clear
        
    }
    func twoPacksPerDay() {
        
        twoPacksSmoke.backgroundColor = UIColor.primaryBlue
        twoPacksSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numCigarettesPerDay = "twoPacksPerDay"
        
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.backgroundColor = UIColor.clear
        
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.backgroundColor = UIColor.clear
        
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.backgroundColor = UIColor.clear
        
        threeOrMorePacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePacksSmoke.backgroundColor = UIColor.clear
        
    }
    func threeOrMorePacksPerDay() {
        
        threeOrMorePacksSmoke.backgroundColor = UIColor.primaryBlue
        threeOrMorePacksSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numCigarettesPerDay = "threeOrMorePacksPerDay"
        
        onePackSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onePackSmoke.backgroundColor = UIColor.clear
        
        oneAndHalfPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneAndHalfPacksSmoke.backgroundColor = UIColor.clear
        
        twoPacksSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoPacksSmoke.backgroundColor = UIColor.clear
        
        oneCigToHalfPack.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneCigToHalfPack.backgroundColor = UIColor.clear
        
    }
    
    //exposure to second-hand smoke
    
    @IBAction func selectSecondHandSmoke(_ sender: UIButton) {
        if sender.tag == 0 {
            dailySecondHand()
        } else if sender.tag == 1 {
            fewTimesPerWeekExposure()
        } else if sender.tag == 2 {
            oncePerWeekExposure()
        } else if sender.tag == 3 {
            neverExposure()
        }
        
    }
    
    
    func dailySecondHand() {
        dailySecondHandSmoke.backgroundColor = UIColor.primaryBlue
        dailySecondHandSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.secondHandSmoke = "dailySecondHand"
        
        fewTimesWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        fewTimesWeekSecondHandSmoke.backgroundColor = UIColor.clear

        onceAWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onceAWeekSecondHandSmoke.backgroundColor = UIColor.clear
        
        neverSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverSecondHandSmoke.backgroundColor = UIColor.clear
    }
    func fewTimesPerWeekExposure() {
        fewTimesWeekSecondHandSmoke.backgroundColor = UIColor.primaryBlue
        fewTimesWeekSecondHandSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.secondHandSmoke = "fewTimesPerWeekExposure"
        
        dailySecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        dailySecondHandSmoke.backgroundColor = UIColor.clear
        
        onceAWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onceAWeekSecondHandSmoke.backgroundColor = UIColor.clear
        
        neverSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverSecondHandSmoke.backgroundColor = UIColor.clear
    }
    func oncePerWeekExposure() {
        onceAWeekSecondHandSmoke.backgroundColor = UIColor.primaryBlue
        onceAWeekSecondHandSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.secondHandSmoke = "oncePerWeekExposure"
        
        fewTimesWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        fewTimesWeekSecondHandSmoke.backgroundColor = UIColor.clear
        
        dailySecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        dailySecondHandSmoke.backgroundColor = UIColor.clear
        
        neverSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverSecondHandSmoke.backgroundColor = UIColor.clear
    }
    func neverExposure() {
        neverSecondHandSmoke.backgroundColor = UIColor.primaryBlue
        neverSecondHandSmoke.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.secondHandSmoke = "neverExposure"
        
        fewTimesWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        fewTimesWeekSecondHandSmoke.backgroundColor = UIColor.clear
        
        onceAWeekSecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        onceAWeekSecondHandSmoke.backgroundColor = UIColor.clear
        
        dailySecondHandSmoke.setTitleColor(UIColor.primaryBlue, for: .normal)
        dailySecondHandSmoke.backgroundColor = UIColor.clear
    }
    
    //do you drink alcohol
    
    @IBAction func selectDoYouDrink(_ sender: UIButton) {
        if sender.tag == 0 {
            yesAlcoholSelected()

            
            oneToTwoDaysDrinkingPerWeek.isEnabled = true
            threeToFiveDaysDrinkingPerWeek.isEnabled = true
            sixToSevenDaysDrinkingPerWeek.isEnabled = true
            
            oneToTwoDrinksPerNight.isEnabled = true
            aboutThreeDrinksPerNight.isEnabled = true
            atLeastThreeDrinksPerNight.isEnabled = true
            
            alcoholQuestionLabel1.textColor = UIColor.primaryTextDark
            alcoholQuestionLabel2.textColor = UIColor.primaryTextDark

            oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
            threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
            sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
            oneToTwoDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
            aboutThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
            atLeastThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
            
        } else if sender.tag == 1 {
            noAlcoholSelected()
            oneToTwoDaysDrinkingPerWeek.isEnabled = false
            threeToFiveDaysDrinkingPerWeek.isEnabled = false
            sixToSevenDaysDrinkingPerWeek.isEnabled = false
            oneToTwoDrinksPerNight.isEnabled = false
            aboutThreeDrinksPerNight.isEnabled = false
            atLeastThreeDrinksPerNight.isEnabled = false
            
            alcoholQuestionLabel1.textColor = UIColor.gray
            alcoholQuestionLabel2.textColor = UIColor.gray
            
            oneToTwoDaysDrinkingPerWeek.backgroundColor = UIColor.white
            threeToFiveDaysDrinkingPerWeek.backgroundColor = UIColor.white
            sixToSevenDaysDrinkingPerWeek.backgroundColor = UIColor.white
            oneToTwoDrinksPerNight.backgroundColor = UIColor.white
            aboutThreeDrinksPerNight.backgroundColor = UIColor.white
            atLeastThreeDrinksPerNight.backgroundColor = UIColor.white
            
        }
        
    }
    
    func yesAlcoholSelected() {
        yesAlcohol.backgroundColor = UIColor.primaryBlue
        yesAlcohol.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.drinkAlcohol = true
        
        noAlcohol.setTitleColor(UIColor.primaryBlue, for: .normal)
        noAlcohol.backgroundColor = UIColor.clear
        
    }
    func noAlcoholSelected() {
        noAlcohol.backgroundColor = UIColor.primaryBlue
        noAlcohol.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.drinkAlcohol = false
        
        yesAlcohol.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesAlcohol.backgroundColor = UIColor.clear
    }
    
    //number of nights spent drinking alcohol
    
    @IBAction func selectNumNightsSpentDrinking(_ sender: UIButton) {
        if sender.tag == 0 {
            oneToTwoDaysDrinkingPerWeekSelected()
        } else if sender.tag == 1 {
            threeToFiveDaysDrinkingPerWeekSelected()
        } else if sender.tag == 2 {
            sixToSevenDaysDrinkningPerWeek()
        }
        
    }
    func oneToTwoDaysDrinkingPerWeekSelected() {
        oneToTwoDaysDrinkingPerWeek.backgroundColor = UIColor.primaryBlue
        oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numNightsSpentDrinking = "oneToTwoDaysDrinkingPerWeekSelected"
        
        threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveDaysDrinkingPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenDaysDrinkingPerWeek.backgroundColor = UIColor.clear
    }
    func threeToFiveDaysDrinkingPerWeekSelected() {
        threeToFiveDaysDrinkingPerWeek.backgroundColor = UIColor.primaryBlue
        threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numNightsSpentDrinking = "threeToFiveDaysDrinkingPerWeekSelected"
        
        oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDaysDrinkingPerWeek.backgroundColor = UIColor.clear
        
        sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenDaysDrinkingPerWeek.backgroundColor = UIColor.clear
    }
    func sixToSevenDaysDrinkningPerWeek() {
        sixToSevenDaysDrinkingPerWeek.backgroundColor = UIColor.primaryBlue
        sixToSevenDaysDrinkingPerWeek.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numNightsSpentDrinking = "sixToSevenDaysDrinkningPerWeek"
        
        threeToFiveDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveDaysDrinkingPerWeek.backgroundColor = UIColor.clear
        
        oneToTwoDaysDrinkingPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDaysDrinkingPerWeek.backgroundColor = UIColor.clear
    }
    
    //number of drinks in one night of drinkning
    
    @IBAction func selectNumberOfDrinksInOneNight(_ sender: UIButton) {
        if sender.tag == 0 {
            oneToTwoDrinksPerNightSelected()
        } else if sender.tag == 1 {
            aboutThreeDrinksPerNightSelected()
        } else if sender.tag == 2 {
            atLeastThreeDrinksPerNightSelected()
        }
        
    }
    
    func oneToTwoDrinksPerNightSelected() {
        oneToTwoDrinksPerNight.backgroundColor = UIColor.primaryBlue
        oneToTwoDrinksPerNight.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numDrinksPerNight = "oneToTwoDrinksPerNightSelected"
        
        aboutThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        aboutThreeDrinksPerNight.backgroundColor = UIColor.clear
        
        atLeastThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        atLeastThreeDrinksPerNight.backgroundColor = UIColor.clear
        
    }
    func aboutThreeDrinksPerNightSelected() {
        aboutThreeDrinksPerNight.backgroundColor = UIColor.primaryBlue
        aboutThreeDrinksPerNight.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numDrinksPerNight = "aboutThreeDrinksPerNightSelected"
        
        oneToTwoDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDrinksPerNight.backgroundColor = UIColor.clear
        
        atLeastThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        atLeastThreeDrinksPerNight.backgroundColor = UIColor.clear
        

    }
    func atLeastThreeDrinksPerNightSelected() {
        atLeastThreeDrinksPerNight.backgroundColor = UIColor.primaryBlue
        atLeastThreeDrinksPerNight.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.numDrinksPerNight = "atLeastThreeDrinksPerNightSelected"
        
        aboutThreeDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        aboutThreeDrinksPerNight.backgroundColor = UIColor.clear
        
        oneToTwoDrinksPerNight.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoDrinksPerNight.backgroundColor = UIColor.clear

    }
    
    //do you take illegal drugs
    @IBAction func selectDrugUse(_ sender: UIButton) {
        if sender.tag == 0 {
            neverDrugsSelected()
        } else if sender.tag == 1 {
            drugsFewTimesPerYearSelected()
        } else if sender.tag == 2 {
            drugsEveryFewMonthsSelected()
        } else if sender.tag == 3 {
            drugsOnceOrMorePerMonth()
        } else if sender.tag == 4 {
            drugsOncePerYearS()
        }
        
    }
    
    
    func neverDrugsSelected() {
        neverDrugs.backgroundColor = UIColor.primaryBlue
        neverDrugs.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.illegalDrugsInfo = "neverDrugsSelected"
        
        drugsFewTimesPerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsFewTimesPerYear.backgroundColor = UIColor.clear
        
        drugsEveryFewMonths.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsEveryFewMonths.backgroundColor = UIColor.clear
        
        drugsOnceMorePerMonth.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOnceMorePerMonth.backgroundColor = UIColor.clear
        
        drugsOncePerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOncePerYear.backgroundColor = UIColor.clear
    }
    func drugsFewTimesPerYearSelected() {
        drugsFewTimesPerYear.backgroundColor = UIColor.primaryBlue
        drugsFewTimesPerYear.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.illegalDrugsInfo = "drugsFewTimesPerYearSelected"
        
        neverDrugs.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverDrugs.backgroundColor = UIColor.clear
        
        drugsEveryFewMonths.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsEveryFewMonths.backgroundColor = UIColor.clear
        
        drugsOnceMorePerMonth.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOnceMorePerMonth.backgroundColor = UIColor.clear
        
        drugsOncePerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOncePerYear.backgroundColor = UIColor.clear
        
    }
    func drugsEveryFewMonthsSelected() {
        drugsEveryFewMonths.backgroundColor = UIColor.primaryBlue
        drugsEveryFewMonths.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.illegalDrugsInfo = "drugsEveryFewMonthsSelected"
        
        drugsFewTimesPerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsFewTimesPerYear.backgroundColor = UIColor.clear
        
        neverDrugs.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverDrugs.backgroundColor = UIColor.clear
        
        drugsOnceMorePerMonth.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOnceMorePerMonth.backgroundColor = UIColor.clear
        
        drugsOncePerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOncePerYear.backgroundColor = UIColor.clear
        
    }
    func drugsOnceOrMorePerMonth() {
        drugsOnceMorePerMonth.backgroundColor = UIColor.primaryBlue
        drugsOnceMorePerMonth.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.illegalDrugsInfo = "drugsOnceOrMorePerMonth"
        
        drugsFewTimesPerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsFewTimesPerYear.backgroundColor = UIColor.clear
        
        drugsEveryFewMonths.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsEveryFewMonths.backgroundColor = UIColor.clear
        
        neverDrugs.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverDrugs.backgroundColor = UIColor.clear
        
        drugsOncePerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOncePerYear.backgroundColor = UIColor.clear
        
    }
    func drugsOncePerYearS() {
        drugsOncePerYear.backgroundColor = UIColor.primaryBlue
        drugsOncePerYear.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.illegalDrugsInfo = "drugsOncePerYear"
        
        drugsFewTimesPerYear.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsFewTimesPerYear.backgroundColor = UIColor.clear
        
        drugsEveryFewMonths.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsEveryFewMonths.backgroundColor = UIColor.clear
        
        neverDrugs.setTitleColor(UIColor.primaryBlue, for: .normal)
        neverDrugs.backgroundColor = UIColor.clear
        
        drugsOnceMorePerMonth.setTitleColor(UIColor.primaryBlue, for: .normal)
        drugsOnceMorePerMonth.backgroundColor = UIColor.clear
        
    }
        
//    @IBAction func calculateButtonTapped(_ sender: UIButton) {
//        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
//            LifeSpecs.finalAge = Double(finalAge)
//        }
//    }
    
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
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toDeathDate" {
                
                if let destinationVC = segue.destination as? DeathDateScreenViewController
                {
                    destinationVC.deathAgeAsDouble = LifeSpecs.lifeSpecifications.finalAge
                }
            }
}
}


