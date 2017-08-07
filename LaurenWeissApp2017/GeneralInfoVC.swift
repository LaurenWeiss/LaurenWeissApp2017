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


class GeneralInfoVC: UIViewController, UIScrollViewDelegate {
    
    //general code connections
    @IBOutlet weak var scrollView: UIScrollView!
    
    //country info
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var countryLabel: UILabel!
    var chosenCountry: String!
    
    @IBOutlet weak var selectCountry: UIButton!
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
    @IBOutlet weak var calculatedBMIValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var bmiStatusLabel: UILabel!
    @IBOutlet weak var highBMIDueToMuscle: UIButton!
    @IBOutlet weak var highBMIDueToFat: UIButton!
    @IBOutlet weak var notHighBMI: UIButton!
    @IBOutlet weak var whyBMILabel: UILabel!
    
    //Education info
    @IBOutlet weak var advancedDegree: UIButton!
    @IBOutlet weak var collegeDegree: UIButton!
    @IBOutlet weak var highSchoolDegree: UIButton!
    @IBOutlet weak var currentlyInHighSchool: UIButton!
    @IBOutlet weak var didntFinishHighSchool: UIButton!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        countryLabel.text = "United States"
        
        calculateButton.layer.cornerRadius = 10
        calculateButton.backgroundColor = UIColor.primaryBlue
        
        datePicker.maximumDate = Date()
        
        var dateComponents = DateComponents()
        dateComponents.year = 1900
        dateComponents.month = 1
        dateComponents.day = 1

        datePicker.minimumDate = Calendar.current.date(from: dateComponents)
        
        datePicker.date = LifeSpecs.lifeSpecifications.dob

        //BMI status label
        bmiStatusLabel.layer.masksToBounds = true
        bmiStatusLabel.layer.cornerRadius = 5
        

        
        
        
        
        
        //Calling Functions: SELECT GENDER
        if LifeSpecs.lifeSpecifications.sex == "male" {
            maleButtonSelected()
        } else {
            femaleButtonSelected()
        }
        
        maleButton.layer.cornerRadius = 10
        femaleButton.layer.cornerRadius = 10
        selectCountry.layer.cornerRadius = 10
        selectCountry.backgroundColor = UIColor.primaryBlue

        
        
        //Calling Functions: SELECT WHY BMI IS HIGH
        if LifeSpecs.lifeSpecifications.whyBMI == "BMI high because of fat" {
            highBMIBecauseOfFatSelected()
        } else if LifeSpecs.lifeSpecifications.whyBMI == "BMI high because of muscle" {
            highBMIBecauseOfMuscleSelected()
        } else if LifeSpecs.lifeSpecifications.whyBMI == "not high BMI" {
            notHighBMISelected()
            whyBMILabel.textColor = UIColor.gray
        }
        highBMIDueToFat.layer.cornerRadius = 10
        highBMIDueToMuscle.layer.cornerRadius = 10
        
        highBMIDueToFat.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToFat.setTitleColor(UIColor.gray, for: .disabled)

        highBMIDueToMuscle.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToMuscle.setTitleColor(UIColor.gray, for: .disabled)
        
        
        
//        notHighBMI.layer.cornerRadius = 10
//        notHighBMI.setTitleColor(UIColor.primaryBlue, for: .normal)
//        notHighBMI.setTitleColor(UIColor.gray, for: .disabled)
        
        //Calling Functions: Select education level
        if LifeSpecs.lifeSpecifications.educationLevel == "Advanced degree" {
            hasAdvancedDegreeSelected()
        } else if LifeSpecs.lifeSpecifications.educationLevel == "College degree" {
            hasCollegeDegreeSelected()
        } else if LifeSpecs.lifeSpecifications.educationLevel == "High school degree" {
            hasHighSchoolDegreeSelected()
        } else if LifeSpecs.lifeSpecifications.educationLevel == "Currently in high school" {
            currentlyInHighSchoolSelected()
        } else if LifeSpecs.lifeSpecifications.educationLevel == "Some high school" {
            someHighSchoolSelected()
        }
        
        
        advancedDegree.layer.cornerRadius = 10
        collegeDegree.layer.cornerRadius = 10
        highSchoolDegree.layer.cornerRadius = 10
        currentlyInHighSchool.layer.cornerRadius = 10
        didntFinishHighSchool.layer.cornerRadius = 10
        
        //Calling Functions: Select whether or not you have diabetes
        if LifeSpecs.lifeSpecifications.diabetes == "no" {
            noDiabetesSelected()
        } else if LifeSpecs.lifeSpecifications.diabetes == "yes" {
            yesDiabetesSelected()
        }
        
        yesDiabetes.layer.cornerRadius = 10
        noDiabetes.layer.cornerRadius = 10
        
        heightLabel.text = String(LifeSpecs.lifeSpecifications.height.rounded()) + " inches"
        weightLabel.text = String(LifeSpecs.lifeSpecifications.weight.rounded()) + " pounds"
        heightSlider.value = Float(LifeSpecs.lifeSpecifications.height.rounded())
        weightSlider.value = Float(LifeSpecs.lifeSpecifications.weight.rounded())
        
        calculateBMI()
        
        
        
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

    
    //BMI Info functions
    
    @IBAction func heightValueDidChange(_ sender: UISlider) {
        let currentValue = sender.value.rounded()
        heightLabel.text = "\(currentValue) inches"
        LifeSpecs.lifeSpecifications.height = Double(sender.value.rounded())
        self.calculateBMI()
    }
    
    @IBAction func weightValueDidChange(_ sender: UISlider) {
        let currentValue = sender.value.rounded()
        weightLabel.text = "\(currentValue) pounds"
        LifeSpecs.lifeSpecifications.weight = Double(sender.value.rounded())
        self.calculateBMI()
    }
    
    
    fileprivate func calculateBMI() {
        let height: Float = heightSlider.value
        let weight: Float = weightSlider.value
        let bmi: Float = (weight / (height*height)) * 703
        let roundedBMI = bmi.rounded()
        
        calculatedBMIValue.text = "\(Int(roundedBMI))"
        self.changeStatus(roundedBMI)
    }
    
    fileprivate func changeStatus(_ bmi: Float) {
        if (bmi < 18) {
            bmiStatusLabel.text = "Underweight"
            LifeSpecs.lifeSpecifications.BMI = "underweight"
            bmiStatusLabel.textColor = UIColor.primaryBlue
            notHighBMISelected()
            whyBMILabel.textColor = UIColor.gray

            highBMIDueToMuscle.isEnabled = false
            highBMIDueToFat.isEnabled = false
        } else if (bmi >= 18 && bmi < 25) {
            bmiStatusLabel.text = "Normal"
            LifeSpecs.lifeSpecifications.BMI = "normal"
            bmiStatusLabel.textColor = UIColor.primaryBlue
            notHighBMISelected()
            whyBMILabel.textColor = UIColor.gray

            highBMIDueToMuscle.isEnabled = false
            highBMIDueToFat.isEnabled = false
        } else if (bmi >= 25 && bmi < 30) {
            bmiStatusLabel.text = "Pre-obese"
            LifeSpecs.lifeSpecifications.BMI = "pre-obese"
            bmiStatusLabel.textColor = UIColor.primaryBlue
            notHighBMISelected()
            whyBMILabel.textColor = UIColor.gray

            highBMIDueToMuscle.isEnabled = false
            highBMIDueToFat.isEnabled = false
        } else {
            bmiStatusLabel.text = "Obese"
            LifeSpecs.lifeSpecifications.BMI = "obese"
            bmiStatusLabel.textColor = UIColor.primaryBlue
            whyBMILabel.textColor = UIColor.primaryTextDark

            highBMIDueToMuscle.isEnabled = true
            highBMIDueToFat.isEnabled = true
//            notHighBMI.isEnabled = false
            
        }
    }

    //MARK: - CALCULATE BUTTON
    //calculate button tapped by user
    
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
    
    //SELECT GENDER
    
    @IBAction func selectGender(_ sender: UIButton) {
        
        if sender.tag == 100 {
            maleButtonSelected()
            
        } else if sender.tag == 101 {
            femaleButtonSelected()
        }
    }
    
    func maleButtonSelected(){
        maleButton.backgroundColor = UIColor.primaryBlue
        maleButton.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.sex = "male"
        
        femaleButton.setTitleColor(UIColor.primaryBlue, for: .normal)
        femaleButton.backgroundColor = UIColor.clear
    }
    
    func femaleButtonSelected() {
        femaleButton.backgroundColor = UIColor.primaryBlue
        femaleButton.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.sex = "female"
        
        maleButton.setTitleColor(UIColor.primaryBlue, for: .normal)
        maleButton.backgroundColor = UIColor.clear
    }
    

    //SELECT WHY BMI IS HIGH OR IF IT IS NOT
    
    
    @IBAction func selectWhyBMI(_ sender: UIButton) {
        if sender.tag == 100 {
            highBMIBecauseOfMuscleSelected()
        } else if sender.tag == 101 {
            highBMIBecauseOfFatSelected()
        } else if sender.tag == 102 {
            notHighBMISelected()
        }
    }
    
    func highBMIBecauseOfFatSelected() {
        highBMIDueToFat.backgroundColor = UIColor.primaryBlue
        highBMIDueToFat.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.whyBMI = "BMI high because of fat"
        
        highBMIDueToMuscle.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToMuscle.backgroundColor = UIColor.clear
        
//        notHighBMI.setTitleColor(UIColor.primaryBlue, for: .normal)
//        notHighBMI.backgroundColor = UIColor.clear
      
    }
    
    func highBMIBecauseOfMuscleSelected() {
        highBMIDueToMuscle.backgroundColor = UIColor.primaryBlue
        highBMIDueToMuscle.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.whyBMI = "BMI high because of muscle"
        
        highBMIDueToFat.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToFat.backgroundColor = UIColor.clear
        
//        notHighBMI.setTitleColor(UIColor.primaryBlue, for: .normal)
//        notHighBMI.backgroundColor = UIColor.clear

    }
    func notHighBMISelected() {
//        notHighBMI.backgroundColor = UIColor.primaryBlue
//        notHighBMI.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.whyBMI = "not high BMI"
        
        highBMIDueToMuscle.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToMuscle.backgroundColor = UIColor.clear
        
        highBMIDueToFat.setTitleColor(UIColor.primaryBlue, for: .normal)
        highBMIDueToFat.backgroundColor = UIColor.clear
        
        
    }
    //SELECT HIGHEST LEVEL OF EDUCATION
    
    
    @IBAction func selectEducationLevel(_ sender: UIButton) {
        
        if sender.tag == 100 {
            hasAdvancedDegreeSelected()
        } else if sender.tag == 101 {
            hasCollegeDegreeSelected()
        } else if sender.tag == 102 {
            hasHighSchoolDegreeSelected()
        } else if sender.tag == 103 {
            currentlyInHighSchoolSelected()
        } else if sender.tag == 104 {
            someHighSchoolSelected()
        }
        
    }
    
    func hasAdvancedDegreeSelected() {
        advancedDegree.backgroundColor = UIColor.primaryBlue
        advancedDegree.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.educationLevel = "Advanced degree"
        
        collegeDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        collegeDegree.backgroundColor = UIColor.clear
        
        highSchoolDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        highSchoolDegree.backgroundColor = UIColor.clear
        
        currentlyInHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        currentlyInHighSchool.backgroundColor = UIColor.clear
        
        didntFinishHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        didntFinishHighSchool.backgroundColor = UIColor.clear
        
    }
    func hasCollegeDegreeSelected() {
        collegeDegree.backgroundColor = UIColor.primaryBlue
        collegeDegree.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.educationLevel = "College degree"
        
        advancedDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        advancedDegree.backgroundColor = UIColor.clear
        
        highSchoolDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        highSchoolDegree.backgroundColor = UIColor.clear
        
        currentlyInHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        currentlyInHighSchool.backgroundColor = UIColor.clear
        
        didntFinishHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        didntFinishHighSchool.backgroundColor = UIColor.clear
        
    }
    func hasHighSchoolDegreeSelected() {
        highSchoolDegree.backgroundColor = UIColor.primaryBlue
        highSchoolDegree.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.educationLevel = "High school degree"
        
        advancedDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        advancedDegree.backgroundColor = UIColor.clear
        
        collegeDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        collegeDegree.backgroundColor = UIColor.clear
        
        currentlyInHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        currentlyInHighSchool.backgroundColor = UIColor.clear
        
        didntFinishHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        didntFinishHighSchool.backgroundColor = UIColor.clear
        
    }
    func currentlyInHighSchoolSelected() {
        currentlyInHighSchool.backgroundColor = UIColor.primaryBlue
        currentlyInHighSchool.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.educationLevel = "Currently in high school"
        
        advancedDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        advancedDegree.backgroundColor = UIColor.clear
        
        highSchoolDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        highSchoolDegree.backgroundColor = UIColor.clear
        
        collegeDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        collegeDegree.backgroundColor = UIColor.clear
        
        didntFinishHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        didntFinishHighSchool.backgroundColor = UIColor.clear
    }
    func someHighSchoolSelected() {
        didntFinishHighSchool.backgroundColor = UIColor.primaryBlue
        didntFinishHighSchool.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.educationLevel = "Some high school"
        
        advancedDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        advancedDegree.backgroundColor = UIColor.clear
        
        currentlyInHighSchool.setTitleColor(UIColor.primaryBlue, for: .normal)
        currentlyInHighSchool.backgroundColor = UIColor.clear
        
        highSchoolDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        highSchoolDegree.backgroundColor = UIColor.clear
        
        collegeDegree.setTitleColor(UIColor.primaryBlue, for: .normal)
        collegeDegree.backgroundColor = UIColor.clear
    }
    //SELECT WHETHER OR NOT YOU HAVE DIABETES
    
    @IBAction func selectYourDiabetes(_ sender: UIButton) {
        if sender.tag == 0 {
            yesDiabetesSelected()
        }
        if sender.tag == 1 {
            noDiabetesSelected()
        }
    }

    func yesDiabetesSelected() {
        yesDiabetes.backgroundColor = UIColor.primaryBlue
        yesDiabetes.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.diabetes = "yes"
        
        noDiabetes.setTitleColor(UIColor.primaryBlue, for: .normal)
        noDiabetes.backgroundColor = UIColor.clear
    
    }
    func noDiabetesSelected() {
        noDiabetes.backgroundColor = UIColor.primaryBlue
        noDiabetes.setTitleColor(UIColor.white, for: .normal)
        LifeSpecs.lifeSpecifications.diabetes = "no"
        
        yesDiabetes.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesDiabetes.backgroundColor = UIColor.clear
    }
    
    //segue controls and life specifications
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCountriesList" {
            if let destinationVC = segue.destination as? EMCCountryPickerController {
                destinationVC.countryDelegate = self
            }
        } else if segue.identifier == "toDeathDate" {
            LifeSpecs.lifeSpecifications.dob = datePicker.date
            //pass your age from lifeSpecs to destination
            //your destination has a container for that ready
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = LifeSpecs.lifeSpecifications.finalAge
            }
        }
    }
}

extension GeneralInfoVC: EMCCountryDelegate {
   
    //SELECT COUNTRY
    func countryController(_ sender: Any!, didSelect chosenCountry: EMCCountry!) {
        LifeSpecs.lifeSpecifications.country = chosenCountry.countryName()
        countryLabel.text = chosenCountry.countryName()
        self.chosenCountry = chosenCountry.countryName()
        //dismiss(animated: true, completion: nil)
    }
}
