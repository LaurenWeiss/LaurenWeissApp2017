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


class EnterHealthDataInformationViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var smokeSelector: UISegmentedControl!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var diabetesSelector: UISegmentedControl!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    var chosenCountry: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = "United States"

    
    }
    
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        let dateFromDatePicker = datePicker.date
        
        let birthDateString = formatter.string(from: dateFromDatePicker)
        
        let sex = genderSelector.selectedSegmentIndex == 0 ? "male" : "female"
        
        let isSmoking = smokeSelector.selectedSegmentIndex == 0 ? true : false
        
        
        var country = "United States"
        if let _ = chosenCountry {

            country = chosenCountry!

        }
        
        APIManager.getResponse(usingBirth: birthDateString, andGender: sex, andCountry: country, ifIsSmoking: isSmoking) { (lifeSpecsForThisUser) in
            User.current.lifeSpecifications = lifeSpecsForThisUser
            
        }
        
    }
    
    func selectGender() -> String {
        switch genderSelector.selectedSegmentIndex {
        case 0:
            return "male"
        default:
            return "female"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCountriesList" {
            if let destinationVC = segue.destination as? EMCCountryPickerController {
                destinationVC.countryDelegate = self
            }
        } else if segue.identifier == "toDeathDate" {
            //pass your age from lifeSpecs to destination
            //your destination has a container for that ready
            if let destinationVC = segue.destination as? DeathDateScreenViewController {
                
            }
        }
    }
}



extension EnterHealthDataInformationViewController: EMCCountryDelegate {
   
    func countryController(_ sender: Any!, didSelect chosenCountry: EMCCountry!) {
        print(chosenCountry.countryName())
        countryLabel.text = chosenCountry.countryName()
        self.chosenCountry = chosenCountry.countryName()
        dismiss(animated: true, completion: nil)
    }
}
