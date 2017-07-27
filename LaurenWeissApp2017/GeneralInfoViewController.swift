//
//  EnterHealthDataInformationViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//
import Foundation
import UIKit
import EMCCountryPickerController


class GeneralInfoViewController: UIViewController, UIScrollViewDelegate {
    
    //general code connections
    @IBOutlet weak var scrollView: UIScrollView!
    
    //country info
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var countryLabel: UILabel!
    var chosenCountry: String!
    
    //date of birth info
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //gender info
   // @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    //diabetes info
    @IBOutlet weak var yesDiabetes: UIButton!
    @IBOutlet weak var noDiabetes: UIButton!
    
    //BMI info
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var calculatedValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var highBMIDueToMuscle: UIButton!
    @IBOutlet weak var highBMIDueToFat: UIButton!
    @IBOutlet weak var notHighBMI: UIButton!
    
    //Education info
    @IBOutlet weak var advancedDegree: UIButton!
    @IBOutlet weak var collegeDegree: UIButton!
    @IBOutlet weak var highSchoolDegree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = "United States"
        
        let lifeSpecs = LifeSpecs()
        User.current.lifeSpecifications = lifeSpecs
        
        //BMI status label
        statusLabel.layer.masksToBounds = true
        statusLabel.layer.cornerRadius = 5
        
        
    }
    
    //BMI Info functions
    
    @IBAction func heightValueDidChange(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        heightLabel.text = "\(currentValue) inches"
        self.calculateBMI()

    }
    
    @IBAction func weightValueDidChange(_ sender: UISlider) {
        let currentValue = Float(sender.value)
        weightLabel.text = "\(currentValue) pounds"
        self.calculateBMI()
    }
    fileprivate func calculateBMI() {
        let height: Float = heightSlider.value
        let weight: Float = weightSlider.value
        let bmi: Float = (weight / (height*height)) * 703
        
        calculatedValue.text = "\(bmi)"
        self.changeStatus(bmi)
    }
    fileprivate func changeStatus(_ bmi: Float) {
        if (bmi < 18) {
            statusLabel.text = "underweight"
            statusLabel.textColor = UIColor.blue
        } else if (bmi >= 18 && bmi < 25) {
            statusLabel.text = "normal"
            statusLabel.textColor = UIColor.green
        } else if (bmi >= 25 && bmi < 30) {
            statusLabel.text = "pre-obese"
            statusLabel.textColor = UIColor.purple
        } else {
            statusLabel.text = "obese"
            statusLabel.textColor = UIColor.red
        }
    }

    //calculate button tapped by user
    
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
    
    //SELECT GENDER
    
//    func selectGender() -> String {
//        switch genderSelector.selectedSegmentIndex {
//        case 0:
//            return "male"
//        default:
//            return "female"
//        }
//    }
    
    func selectGender() {
        
        if maleButton.isSelected {
        maleButton.isEnabled = true
        maleButton.backgroundColor = UIColor.green
        }
        if femaleButton.isSelected {
        femaleButton.isEnabled = true
        femaleButton.backgroundColor = UIColor.green
        }
    }
    
    //If BMI is high...
    //Is it high because of muscle or fat? SELECT
    
    func ifHighBMI() {
        if highBMIDueToFat.isSelected {
            highBMIDueToFat.isEnabled = true
            highBMIDueToFat.backgroundColor = UIColor.green
        }
        if highBMIDueToMuscle.isSelected {
            highBMIDueToMuscle.isEnabled = true
            highBMIDueToMuscle.backgroundColor = UIColor.green
        }
        
    }
    
    //HIGHEST LEVEL OF EDUCATION SELECT
    
    func selectEducation() {
        if advancedDegree.isSelected {
            advancedDegree.isEnabled = true
            advancedDegree.backgroundColor = UIColor.green
        }
        if collegeDegree.isSelected {
            collegeDegree.isEnabled = true
            collegeDegree.backgroundColor = UIColor.green
        }
        if highSchoolDegree.isSelected {
            highSchoolDegree.isEnabled = true
            highSchoolDegree.backgroundColor = UIColor.green
        }
    }
    
    //DIABETES SELECTOR
    func selectDiabetes() {
        if yesDiabetes.isSelected {
            yesDiabetes.isEnabled = true
            yesDiabetes.backgroundColor = UIColor.green
        }
        if noDiabetes.isSelected {
            noDiabetes.isEnabled = true
            noDiabetes.backgroundColor = UIColor.green
    }
    
    }
    
    //segue controls and life specifications
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCountriesList" {
            if let destinationVC = segue.destination as? EMCCountryPickerController {
                destinationVC.countryDelegate = self
            }
        } else if segue.identifier == "toDeathDate" {
            User.current.lifeSpecifications?.dob = datePicker.date
            User.current.lifeSpecifications?.sex = selectGender()
            //pass your age from lifeSpecs to destination
            //your destination has a container for that ready
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = User.current.finalAge
            }
        }
    }
}

extension GeneralInfoViewController: EMCCountryDelegate {
   
    
    //SELECT COUNTRY
    func countryController(_ sender: Any!, didSelect chosenCountry: EMCCountry!) {
        print(chosenCountry.countryName())
        countryLabel.text = chosenCountry.countryName()
        self.chosenCountry = chosenCountry.countryName()
        dismiss(animated: true, completion: nil)
    }
}
