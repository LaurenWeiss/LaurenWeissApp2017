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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        } else if User.current.lifeSpecifications.sweetsInfo == "one to two days per week" {
            oneToTwoDaysCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "three to five days per week" {
            threeToFiveDaysCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "once a day" {
            onceADayCandy()
        } else if User.current.lifeSpecifications.sweetsInfo == "more than once a day" {
            moreThanOnceADayCandy()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT CARBS
        if User.current.lifeSpecifications.carbsInfo == "one or fewer servings per week" {
            oneOrFewerCarbsPerWeek()
        } else if User.current.lifeSpecifications.carbsInfo == "one serving twice per week" {
            oneServingCarbsTwicePerWeek()
        } else if User.current.lifeSpecifications.carbsInfo == "one serving every other day" {
            oneServingCarbsEveryOtherDay()
        } else if User.current.lifeSpecifications.carbsInfo == "one to two servings per day" {
            oneToTwoServingsCarbsEveryDay()
        } else if User.current.lifeSpecifications.carbsInfo == "three or more servings per day" {
            threeOrMoreServingsCarbsPerDay()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT RED MEAT
        if User.current.lifeSpecifications.redMeatInfo == "no red meat" {
            noRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "one to two days per week" {
            oneToTwoDaysRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "three to five days per week" {
            threeToFiveDaysRedMeat()
        } else if User.current.lifeSpecifications.redMeatInfo == "six to seven days per week" {
            sixToSevenDaysRedMeat()
        }
        
        //Calling Functions: SELECT HOW OFTEN YOU EAT FAST FOODS
        if User.current.lifeSpecifications.fastFoodsInfo == "none" {
            noFastFoods()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "one to two servings per day" {
            oneToTwoServingsFastFood()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "three to four servings per week" {
            threeToFourServingsFastFood()
        } else if User.current.lifeSpecifications.fastFoodsInfo == "over five servings per week" {
            overFiveServingsPerWeekFastFood()
        }
        
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //cups of coffee info
    func noCoffeeSelected() {
        
    }
    func oneToTwoCupsCoffeeSelected() {
        
    }
    func twoToThreeCupsCoffeeSelected() {
        
    }
    
    //dairy info
    func zeroToOneServingsDairySelected() {
        
    }
    func twoToThreeServingsDairySelected() {
        
    }
    func threeOrMoreServingsDairySelected() {
        
    }
    
    //sweets info
    func rarelyHaveCandy() {
        
    }
    func oneToTwoDaysCandy() {
        
    }
    func threeToFiveDaysCandy() {
        
    }
    func onceADayCandy() {
        
    }
    func moreThanOnceADayCandy() {
        
    }
    
    //carbs info
    func oneOrFewerCarbsPerWeek() {
        
    }
    func oneServingCarbsTwicePerWeek() {
        
    }
    func oneServingCarbsEveryOtherDay() {
        
    }
    func oneToTwoServingsCarbsEveryDay() {
        
    }
    func threeOrMoreServingsCarbsPerDay() {
        
    }
    
    
    //red meat info
  
    func noRedMeat() {
        
    }
    func oneToTwoDaysRedMeat() {
        
    }
    func threeToFiveDaysRedMeat() {
        
    }
    func sixToSevenDaysRedMeat() {
        
    }
    
    //fast foods info
    func noFastFoods() {
        
    }
    func oneToTwoServingsFastFood() {
        
    }
    func threeToFourServingsFastFood() {
        
    }
    func overFiveServingsPerWeekFastFood() {
        
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
