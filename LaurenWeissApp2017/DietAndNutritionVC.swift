//
//  DietAndNutritionVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class DietAndNutritionVC: UIViewController, UIScrollViewDelegate {
    
    //cups of coffee info
    
    @IBOutlet weak var zeroCupsCoffee: UIButton!
    @IBOutlet weak var oneToTwoCupsCoffee: UIButton!
    @IBOutlet weak var twoToThreeCupsCoffee: UIButton!
    
    //dairy info
    
    @IBOutlet weak var zeroToOneDairy: UIButton!
    @IBOutlet weak var twoToThreeDairy: UIButton!
    @IBOutlet weak var threeOrMoreDairy: UIButton!
    
    //sweets info
    
    @IBOutlet weak var rarelyCandy: UIButton!
    @IBOutlet weak var oneToTwoCandy: UIButton!
    @IBOutlet weak var threeToFiveCandy: UIButton!
    @IBOutlet weak var moreThanonceADayCandy: UIButton!
    @IBOutlet weak var OnceADayCandy: UIButton!
    
    
    //carbs info
    
    @IBOutlet weak var oneOrFewerCarbs: UIButton!
    @IBOutlet weak var oneTwicePerWeekCarbs: UIButton!
    @IBOutlet weak var oneEveryOtherDayCarbs: UIButton!
    @IBOutlet weak var oneToTwoADayCarbs: UIButton!
    @IBOutlet weak var threeOrMorePerDayCarbs: UIButton!
    
    //red meat info
    
    @IBOutlet weak var noMeat: UIButton!
    @IBOutlet weak var oneToTwoMeat: UIButton!
    @IBOutlet weak var sixToSevenMeat: UIButton!
    @IBOutlet weak var threeToFiveMeat: UIButton!
    
    //fast foods info
    
    @IBOutlet weak var noFastFood: UIButton!
    @IBOutlet weak var oneToTwoFastfood: UIButton!
    @IBOutlet weak var threeToFourFastFood: UIButton!
    @IBOutlet weak var overFiveFastFood: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 10

        //making the buttons have rounded corners
        
        zeroCupsCoffee.layer.cornerRadius = 10
        oneToTwoCupsCoffee.layer.cornerRadius = 10
        twoToThreeCupsCoffee.layer.cornerRadius = 10
        
        zeroToOneDairy.layer.cornerRadius = 10
        twoToThreeDairy.layer.cornerRadius = 10
        threeOrMoreDairy.layer.cornerRadius = 10
        
        rarelyCandy.layer.cornerRadius = 10
        oneToTwoCandy.layer.cornerRadius = 10
        threeToFiveCandy.layer.cornerRadius = 10
        moreThanonceADayCandy.layer.cornerRadius = 10
        OnceADayCandy.layer.cornerRadius = 10
        
        oneOrFewerCarbs.layer.cornerRadius = 10
        oneTwicePerWeekCarbs.layer.cornerRadius = 10
        oneEveryOtherDayCarbs.layer.cornerRadius = 10
        oneToTwoADayCarbs.layer.cornerRadius = 10
        threeOrMorePerDayCarbs.layer.cornerRadius = 10
        
        noMeat.layer.cornerRadius = 10
        oneToTwoMeat.layer.cornerRadius = 10
        sixToSevenMeat.layer.cornerRadius = 10
        threeToFiveMeat.layer.cornerRadius = 10
        
        noFastFood.layer.cornerRadius = 10
        oneToTwoFastfood.layer.cornerRadius = 10
        threeToFourFastFood.layer.cornerRadius = 10
        overFiveFastFood.layer.cornerRadius = 10
        
        //Calling Functions: SELECT NUM CAFFEINATED CUPS OF COFFEE PER DAY
        
        if User.current.lifeSpecifications.numCoffeeCups == "none" {
            noCoffeeSelected()
        } else if User.current.lifeSpecifications.numCoffeeCups == "one to two cups" {
            oneToTwoCupsCoffeeSelected()
        } else if User.current.lifeSpecifications.numCoffeeCups == "two to three cups" {
            twoToThreeCupsCoffeeSelected()
        }
        
        //Calling Functions: SELECT NUM SERVINGS OF DAIRY PER DAY
        if User.current.lifeSpecifications.numDairy == "zero to one" {
            zeroToOneServingsDairySelected()
        } else if User.current.lifeSpecifications.numDairy == "two to three" {
            twoToThreeServingsDairySelected()
        } else if User.current.lifeSpecifications.numDairy == "three or more" {
            threeOrMoreServingsDairySelected()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT SWEETS
        if User.current.lifeSpecifications.sweetsInfo == "rarely" {
            rarelyHaveCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "onetotwodaysperweek" {
            oneToTwoDaysCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "threetofivedaysperweek" {
            threeToFiveDaysCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "onceaday" {
            onceADayCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "morethanonceaday" {
            moreThanOnceADayCandy()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT CARBS
        if User.current.lifeSpecifications.carbsInfo == "oneorfewerservings" {
            oneOrFewerCarbsPerWeek()
        } else if User.current.lifeSpecifications.carbsInfo == "oneservingtwicepereek" {
            oneServingCarbsTwicePerWeek()
        } else if User.current.lifeSpecifications.carbsInfo == "everyotherday" {
            oneServingCarbsEveryOtherDay()
        } else if User.current.lifeSpecifications.carbsInfo == "onetotwoservings" {
            oneToTwoServingsCarbsEveryDay()
        } else if User.current.lifeSpecifications.carbsInfo == "threeormore" {
            threeOrMoreServingsCarbsPerDay()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT RED MEAT
        if User.current.lifeSpecifications.redMeatInfo == "noredmeat" {
            noRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "oneto2" {
            oneToTwoDaysRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "3to5" {
            threeToFiveDaysRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "6to7" {
            sixToSevenDaysRedMeat()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT FAST FOODS
        if User.current.lifeSpecifications.fastFoodsInfo == "none" {
            noFastFoods()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "1to2" {
            oneToTwoServingsFastFood()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "3to4" {
            threeToFourServingsFastFood()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "over5" {
            overFiveServingsPerWeekFastFood()
        }
        
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //cups of coffee info
    @IBAction func selectCoffee(_ sender: UIButton) {
        if sender.tag == 0 {
            noCoffeeSelected()
        } else if sender.tag == 1 {
            oneToTwoCupsCoffeeSelected()
        } else if sender.tag == 2 {
            twoToThreeCupsCoffeeSelected()
    }
    }

    func noCoffeeSelected() {
        zeroCupsCoffee.backgroundColor = UIColor.primaryBlue
        zeroCupsCoffee.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numCoffeeCups = "none"
        
        oneToTwoCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCupsCoffee.backgroundColor = UIColor.clear
        
        twoToThreeCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoToThreeCupsCoffee.backgroundColor = UIColor.clear
    }
    func oneToTwoCupsCoffeeSelected() {
        oneToTwoCupsCoffee.backgroundColor = UIColor.primaryBlue
        oneToTwoCupsCoffee.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numCoffeeCups = "one to two cups"
        
        zeroCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroCupsCoffee.backgroundColor = UIColor.clear
        
        twoToThreeCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoToThreeCupsCoffee.backgroundColor = UIColor.clear
        
    }
    func twoToThreeCupsCoffeeSelected() {
        twoToThreeCupsCoffee.backgroundColor = UIColor.primaryBlue
        twoToThreeCupsCoffee.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numCoffeeCups = "two to three cups"
        
        zeroCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroCupsCoffee.backgroundColor = UIColor.clear
        
        oneToTwoCupsCoffee.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCupsCoffee.backgroundColor = UIColor.clear
        
    }
    
    //dairy info
    @IBAction func selectDairy(_ sender: UIButton) {
        if sender.tag == 0 {
            zeroToOneServingsDairySelected()
        } else if sender.tag == 1 {
            twoToThreeServingsDairySelected()
        } else if sender.tag == 2 {
            threeOrMoreServingsDairySelected()
        }
    }
    
    func zeroToOneServingsDairySelected() {
        zeroToOneDairy.backgroundColor = UIColor.primaryBlue
        zeroToOneDairy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numDairy = "zero to one"
        
        twoToThreeDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoToThreeDairy.backgroundColor = UIColor.clear
        
        threeOrMoreDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMoreDairy.backgroundColor = UIColor.clear
    }
    func twoToThreeServingsDairySelected() {
        twoToThreeDairy.backgroundColor = UIColor.primaryBlue
        twoToThreeDairy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numDairy = "two to three"
        
        zeroToOneDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroToOneDairy.backgroundColor = UIColor.clear
        
        threeOrMoreDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMoreDairy.backgroundColor = UIColor.clear
        
    }
    func threeOrMoreServingsDairySelected() {
        threeOrMoreDairy.backgroundColor = UIColor.primaryBlue
        threeOrMoreDairy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.numDairy = "three or more"
        
        zeroToOneDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        zeroToOneDairy.backgroundColor = UIColor.clear
        
        twoToThreeDairy.setTitleColor(UIColor.primaryBlue, for: .normal)
        twoToThreeDairy.backgroundColor = UIColor.clear
    }
    
    //sweets info
    @IBAction func selectSweets(_ sender: UIButton) {
        if sender.tag == 0 {
            rarelyHaveCandy()
        } else if sender.tag == 1 {
            oneToTwoDaysCandy()
        } else if sender.tag == 2 {
            threeToFiveDaysCandy()
        }
        else if sender.tag == 3 {
            onceADayCandy()
        }
        else if sender.tag == 4 {
            moreThanOnceADayCandy()
        }
    }
    
    func rarelyHaveCandy() {
        rarelyCandy.backgroundColor = UIColor.primaryBlue
        rarelyCandy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sweetsInfo = "rarely"
        
        oneToTwoCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCandy.backgroundColor = UIColor.clear
        
        threeToFiveCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveCandy.backgroundColor = UIColor.clear
        
        OnceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        OnceADayCandy.backgroundColor = UIColor.clear
        
        moreThanonceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanonceADayCandy.backgroundColor = UIColor.clear
    }
    func oneToTwoDaysCandy() {
        oneToTwoCandy.backgroundColor = UIColor.primaryBlue
        oneToTwoCandy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sweetsInfo = "onetotwodaysperweek"
        
        rarelyCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelyCandy.backgroundColor = UIColor.clear
        
        threeToFiveCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveCandy.backgroundColor = UIColor.clear
        
        OnceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        OnceADayCandy.backgroundColor = UIColor.clear
        
        moreThanonceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanonceADayCandy.backgroundColor = UIColor.clear

    }
    func threeToFiveDaysCandy() {
        threeToFiveCandy.backgroundColor = UIColor.primaryBlue
        threeToFiveCandy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sweetsInfo = "threetofivedaysperweek"
        
        oneToTwoCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCandy.backgroundColor = UIColor.clear
        
        rarelyCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelyCandy.backgroundColor = UIColor.clear
        
        OnceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        OnceADayCandy.backgroundColor = UIColor.clear
        
        moreThanonceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanonceADayCandy.backgroundColor = UIColor.clear

        
    }
    func onceADayCandy() {
        OnceADayCandy.backgroundColor = UIColor.primaryBlue
        OnceADayCandy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sweetsInfo = "onceaday"
        
        oneToTwoCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCandy.backgroundColor = UIColor.clear
        
        threeToFiveCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveCandy.backgroundColor = UIColor.clear
        
        rarelyCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelyCandy.backgroundColor = UIColor.clear
        
        moreThanonceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        moreThanonceADayCandy.backgroundColor = UIColor.clear

        
    }
    func moreThanOnceADayCandy() {
        moreThanonceADayCandy.backgroundColor = UIColor.primaryBlue
        moreThanonceADayCandy.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sweetsInfo = "morethanonceaday"
        
        oneToTwoCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoCandy.backgroundColor = UIColor.clear
        
        threeToFiveCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveCandy.backgroundColor = UIColor.clear
        
        OnceADayCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        OnceADayCandy.backgroundColor = UIColor.clear
        
        rarelyCandy.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelyCandy.backgroundColor = UIColor.clear

        
    }
    
    //carbs info
    
    @IBAction func selectCarbs(_ sender: UIButton) {
        if sender.tag == 0 {
            oneOrFewerCarbsPerWeek()
        } else if sender.tag == 1 {
            oneServingCarbsTwicePerWeek()
        } else if sender.tag == 2 {
            oneServingCarbsEveryOtherDay()
        }
        else if sender.tag == 3 {
            oneToTwoServingsCarbsEveryDay()
        }
        else if sender.tag == 4 {
            threeOrMoreServingsCarbsPerDay()
        }
    }
    
    func oneOrFewerCarbsPerWeek() {
        oneOrFewerCarbs.backgroundColor = UIColor.primaryBlue
        oneOrFewerCarbs.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.carbsInfo = "oneorfewerservings"
        
        oneTwicePerWeekCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneTwicePerWeekCarbs.backgroundColor = UIColor.clear
        
        oneEveryOtherDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneEveryOtherDayCarbs.backgroundColor = UIColor.clear
        
        oneToTwoADayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoADayCarbs.backgroundColor = UIColor.clear
        
        threeOrMorePerDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePerDayCarbs.backgroundColor = UIColor.clear
        
    }
    func oneServingCarbsTwicePerWeek() {
        oneTwicePerWeekCarbs.backgroundColor = UIColor.primaryBlue
        oneTwicePerWeekCarbs.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.carbsInfo = "oneservingtwicepereek"
        
        oneOrFewerCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneOrFewerCarbs.backgroundColor = UIColor.clear
        
        oneEveryOtherDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneEveryOtherDayCarbs.backgroundColor = UIColor.clear
        
        oneToTwoADayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoADayCarbs.backgroundColor = UIColor.clear
        
        threeOrMorePerDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePerDayCarbs.backgroundColor = UIColor.clear
        
    }
    func oneServingCarbsEveryOtherDay() {
        oneEveryOtherDayCarbs.backgroundColor = UIColor.primaryBlue
        oneEveryOtherDayCarbs.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.carbsInfo = "everyotherday"
        
        oneTwicePerWeekCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneTwicePerWeekCarbs.backgroundColor = UIColor.clear
        
        oneOrFewerCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneOrFewerCarbs.backgroundColor = UIColor.clear
        
        oneToTwoADayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoADayCarbs.backgroundColor = UIColor.clear
        
        threeOrMorePerDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePerDayCarbs.backgroundColor = UIColor.clear
    }
    func oneToTwoServingsCarbsEveryDay() {
        oneToTwoADayCarbs.backgroundColor = UIColor.primaryBlue
        oneToTwoADayCarbs.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.carbsInfo = "onetotwoservings"
        
        oneTwicePerWeekCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneTwicePerWeekCarbs.backgroundColor = UIColor.clear
        
        oneEveryOtherDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneEveryOtherDayCarbs.backgroundColor = UIColor.clear
        
        oneOrFewerCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneOrFewerCarbs.backgroundColor = UIColor.clear
        
        threeOrMorePerDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeOrMorePerDayCarbs.backgroundColor = UIColor.clear
    }
    func threeOrMoreServingsCarbsPerDay() {
        threeOrMorePerDayCarbs.backgroundColor = UIColor.primaryBlue
        threeOrMorePerDayCarbs.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.carbsInfo = "threeormore"
        
        oneTwicePerWeekCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneTwicePerWeekCarbs.backgroundColor = UIColor.clear
        
        oneEveryOtherDayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneEveryOtherDayCarbs.backgroundColor = UIColor.clear
        
        oneToTwoADayCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoADayCarbs.backgroundColor = UIColor.clear
        
        oneOrFewerCarbs.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneOrFewerCarbs.backgroundColor = UIColor.clear
    }
    
    
    //red meat info
    @IBAction func selectRedMeat(_ sender: UIButton) {
        if sender.tag == 0 {
            noRedMeat()
        } else if sender.tag == 1 {
            oneToTwoDaysRedMeat()
        } else if sender.tag == 2 {
            threeToFiveDaysRedMeat()
        }
        else if sender.tag == 3 {
            sixToSevenDaysRedMeat()
        }
    }
    func noRedMeat() {
        noMeat.backgroundColor = UIColor.primaryBlue
        noMeat.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.redMeatInfo = "noredmeat"
        
        oneToTwoMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoMeat.backgroundColor = UIColor.clear
       
        threeToFiveMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveMeat.backgroundColor = UIColor.clear
        
        sixToSevenMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenMeat.backgroundColor = UIColor.clear
        
    }
    func oneToTwoDaysRedMeat() {
        oneToTwoMeat.backgroundColor = UIColor.primaryBlue
        oneToTwoMeat.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.redMeatInfo = "oneto2"
        
        noMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        noMeat.backgroundColor = UIColor.clear
        
        threeToFiveMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveMeat.backgroundColor = UIColor.clear
        
        sixToSevenMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenMeat.backgroundColor = UIColor.clear
        
        
    }
    func threeToFiveDaysRedMeat() {
        threeToFiveMeat.backgroundColor = UIColor.primaryBlue
        threeToFiveMeat.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.redMeatInfo = "3to5"
        
        oneToTwoMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoMeat.backgroundColor = UIColor.clear
        
        noMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        noMeat.backgroundColor = UIColor.clear
        
        sixToSevenMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        sixToSevenMeat.backgroundColor = UIColor.clear
        
        
    }
    func sixToSevenDaysRedMeat() {
        sixToSevenMeat.backgroundColor = UIColor.primaryBlue
        sixToSevenMeat.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.redMeatInfo = "6to7"
        
        oneToTwoMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoMeat.backgroundColor = UIColor.clear
        
        threeToFiveMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFiveMeat.backgroundColor = UIColor.clear
        
        noMeat.setTitleColor(UIColor.primaryBlue, for: .normal)
        noMeat.backgroundColor = UIColor.clear
        
    }
    
    //fast foods info
    
    @IBAction func selectFastFoods(_ sender: UIButton) {
        if sender.tag == 0 {
            noFastFoods()
        } else if sender.tag == 1 {
            oneToTwoServingsFastFood()
        } else if sender.tag == 2 {
            threeToFourServingsFastFood()
        }
        else if sender.tag == 3 {
            overFiveServingsPerWeekFastFood()
        }
    }
    
    func noFastFoods() {
        noFastFood.backgroundColor = UIColor.primaryBlue
        noFastFood.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fastFoodsInfo = "none"
        
        oneToTwoFastfood.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoFastfood.backgroundColor = UIColor.clear
        
        threeToFourFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFourFastFood.backgroundColor = UIColor.clear
        
        overFiveFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        overFiveFastFood.backgroundColor = UIColor.clear
    }
    func oneToTwoServingsFastFood() {
        oneToTwoFastfood.backgroundColor = UIColor.primaryBlue
        oneToTwoFastfood.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fastFoodsInfo = "1to2"
        
        noFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        noFastFood.backgroundColor = UIColor.clear
        
        threeToFourFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFourFastFood.backgroundColor = UIColor.clear
        
        overFiveFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        overFiveFastFood.backgroundColor = UIColor.clear
    }
    func threeToFourServingsFastFood() {
        threeToFourFastFood.backgroundColor = UIColor.primaryBlue
        threeToFourFastFood.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fastFoodsInfo = "3to4"
        
        oneToTwoFastfood.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoFastfood.backgroundColor = UIColor.clear
        
        noFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        noFastFood.backgroundColor = UIColor.clear
        
        overFiveFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        overFiveFastFood.backgroundColor = UIColor.clear
        
    }
    func overFiveServingsPerWeekFastFood() {
        overFiveFastFood.backgroundColor = UIColor.primaryBlue
        overFiveFastFood.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fastFoodsInfo = "over5"
        
        oneToTwoFastfood.setTitleColor(UIColor.primaryBlue, for: .normal)
        oneToTwoFastfood.backgroundColor = UIColor.clear
        
        threeToFourFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        threeToFourFastFood.backgroundColor = UIColor.clear
        
        noFastFood.setTitleColor(UIColor.primaryBlue, for: .normal)
        noFastFood.backgroundColor = UIColor.clear
        
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
