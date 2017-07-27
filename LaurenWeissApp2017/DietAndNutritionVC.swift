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
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //cups of coffee info
    func coffeeSelector(){
        if zeroCupsCoffee.isSelected {
            zeroCupsCoffee.isEnabled = true
            zeroCupsCoffee.backgroundColor = UIColor.green
        }
        if oneToTwoCupsCoffee.isSelected {
            oneToTwoCupsCoffee.isEnabled = true
            oneToTwoCupsCoffee.backgroundColor = UIColor.green
        }
        if twoToThreeCupsCoffee.isSelected {
            twoToThreeCupsCoffee.isEnabled = true
            twoToThreeCupsCoffee.backgroundColor = UIColor.green
        }
    }
    
    //dairy info
    func dairySelector(){
        if zeroToOneDairy.isSelected {
            zeroToOneDairy.isEnabled = true
            zeroToOneDairy.backgroundColor = UIColor.green
        }
        if twoToThreeDairy.isSelected {
            twoToThreeDairy.isEnabled = true
            twoToThreeDairy.backgroundColor = UIColor.green
        }
        if threeOrMoreDairy.isSelected {
            threeOrMoreDairy.isEnabled = true
            threeOrMoreDairy.backgroundColor = UIColor.green
        }

    }
    
    //sweets info
    func sweetsSelector(){
        if rarelyCandy.isSelected {
            rarelyCandy.isEnabled = true
            rarelyCandy.backgroundColor = UIColor.green
        }
        if OnceADayCandy.isSelected {
            OnceADayCandy.isEnabled = true
            OnceADayCandy.backgroundColor = UIColor.green
        }
        if oneToTwoCandy.isSelected {
            oneToTwoCandy.isEnabled = true
            oneToTwoCandy.backgroundColor = UIColor.green
        }
        if threeToFiveCandy.isSelected {
            threeToFiveCandy.isEnabled = true
            threeToFiveCandy.backgroundColor = UIColor.green
        }
        if moreThanonceADayCandy.isSelected {
            moreThanonceADayCandy.isEnabled = true
            moreThanonceADayCandy.backgroundColor = UIColor.green
        }
    }
    
    //carbs info
    func carbsSelector(){
        if oneOrFewerCarbs.isSelected {
            oneOrFewerCarbs.isEnabled = true
            oneOrFewerCarbs.backgroundColor = UIColor.green
        }
        if oneToTwoADayCarbs.isSelected {
            oneToTwoADayCarbs.isEnabled = true
            oneToTwoADayCarbs.backgroundColor = UIColor.green
        }
        if oneTwicePerWeekCarbs.isSelected {
            oneTwicePerWeekCarbs.isEnabled = true
            oneTwicePerWeekCarbs.backgroundColor = UIColor.green
        }
        if oneEveryOtherDayCarbs.isSelected {
            oneEveryOtherDayCarbs.isEnabled = true
            oneEveryOtherDayCarbs.backgroundColor = UIColor.green
        }
        if threeOrMorePerDayCarbs.isSelected {
            threeOrMorePerDayCarbs.isEnabled = true
            threeOrMorePerDayCarbs.backgroundColor = UIColor.green
        }
    }
    
    
    //red meat info
    func redMeatSelector(){
        if noMeat.isSelected {
            noMeat.isEnabled = true
            noMeat.backgroundColor = UIColor.green
        }
        if oneToTwoMeat.isSelected {
            oneToTwoMeat.isEnabled = true
            oneToTwoMeat.backgroundColor = UIColor.green
        }
        if sixToSevenMeat.isSelected {
            sixToSevenMeat.isEnabled = true
            sixToSevenMeat.backgroundColor = UIColor.green
        }
        if threeToFiveMeat.isSelected {
            threeToFiveMeat.isEnabled = true
            threeToFiveMeat.backgroundColor = UIColor.green
        }
        
    }
    
    //fast foods info
    func fastFoodsSelector(){
        if noFastFood.isSelected {
            noFastFood.isEnabled = true
            noFastFood.backgroundColor = UIColor.green
        }
        if oneToTwoFastfood.isSelected {
            oneToTwoFastfood.isEnabled = true
            oneToTwoFastfood.backgroundColor = UIColor.green
        }
        if threeToFourFastFood.isSelected {
            threeToFourFastFood.isEnabled = true
            threeToFourFastFood.backgroundColor = UIColor.green
        }
        if overFiveFastFood.isSelected {
            overFiveFastFood.isEnabled = true
            overFiveFastFood.backgroundColor = UIColor.green
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
