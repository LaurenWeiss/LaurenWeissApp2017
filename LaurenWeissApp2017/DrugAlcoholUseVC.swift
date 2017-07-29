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
    
//alcohol info
    
    @IBOutlet weak var yesAlcohol: UIButton!
    @IBOutlet weak var noAlcohol: UIButton!
    
    
    @IBOutlet weak var sixToSevenDaysDrinkingPerWeek: UIButton!
    @IBOutlet weak var threeToFiveDaysDrinkingPerWeek: UIButton!
    @IBOutlet weak var oneToTwoDaysDrinkingPerWeek: UIButton!
    
    @IBOutlet weak var oneToTwoDrinksPerNight: UIButton!
    
    @IBOutlet weak var atLeastThreeDrinksPerNight: UIButton!
    @IBOutlet weak var aboutThreeDrinksPerNight: UIButton!
    
//drugs info
    @IBOutlet weak var neverDrugs: UIButton!
    @IBOutlet weak var drugsOncePerYear: UIButton!
    @IBOutlet weak var drugsFewTimesPerYear: UIButton!
    @IBOutlet weak var drugsOnceMorePerMonth: UIButton!
    @IBOutlet weak var drugsEveryFewMonths: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        //Calling Functions: SELECT NUMBER OF CIGARETTE PACKS SMOKED PER DAY
        
        //Calling Functions: SELECT SECOND-HAND SMOKING EXPOSURE
        
        //Calling Functions: SELECT WHETHER OR NOT YOU DRINK ALCOHOL
        
        //Calling Functions: SELECT NUM NIGHTS SPENT DRINKING
        
        //Calling Functions: SELECT HOW NUM DRINKS YOU HAVE IN ONE NIGHT OF DRINKING ALCOHOL
        
        //Calling Functions: SELECT WHETHER OR NOT YOU TAKE ILLEGAL DRUGS
    
        
    }
    
    //do you smoke
    func yesSmoke() {
        
    }
    func noSmoke() {
        
    }
    
    //how many packs of cigs per day
    func oneCigToHalfAPack() {
        
    }
    func onePackCigPerDay() {
        
    }
    func oneAndAHalfPacksPerDay() {
        
    }
    func twoPacksPerDay() {
        
    }
    func threeOrMorePacksPerDay() {
        
    }
    
    //exposure to second-hand smoke
    func dailySecondHand() {
        
    }
    func fewTimesPerWeekExposure() {
        
    }
    func oncePerWeekExposure() {
        
    }
    func neverExposure() {
        
    }
    
    //do you drink alcohol
    func yesAlcohol() {
        
    }
    func noAlcohol() {
        
    }
    
    //number of nights spent drinking alcohol
    func oneToTwoDaysDrinkingPerWeek() {
        
    }
    func threeToFiveDaysDrinkingPerWeek() {
        
    }
    func sixToSevenDaysDrinkningPerWeek() {
        
    }
    
    //number of drinks in one night of drinkning
    func oneToTwoDrinksPerNight() {
        
    }
    func aboutThreeDrinksPerNight() {
        
    }
    func atLeastThreeDrinksPerNight() {
        
    }
    
    //do you take illegal drugs
    func neverDrugs() {
        
    }
    func drugsFewTimesPerYear() {
        
    }
    func drugsEveryFewMonths() {
        
    }
    func drugsOnceOrMorePerMonth() {
        
    }
    
        
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
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

    
}
