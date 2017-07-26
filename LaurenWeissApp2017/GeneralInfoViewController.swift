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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var diabetesSelector: UISegmentedControl!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var chosenCountry: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = "United States"
        
        let lifeSpecs = LifeSpecs()
        User.current.lifeSpecifications = lifeSpecs
        
        
        
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
    
    //SELECT GENDER
    
    func selectGender() -> String {
        switch genderSelector.selectedSegmentIndex {
        case 0:
            return "male"
        default:
            return "female"
        }
    }
    
    
    //SELECT WEIGHT
    
    //SELECT HEIGHT
    
    
    //If BMI is high...
    //Is it high because of muscle or fat? SELECT
    
    //HIGHEST LEVEL OF EDUCATION SELECT
    
    //DIABETES SELECTOR
    
    
    
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
