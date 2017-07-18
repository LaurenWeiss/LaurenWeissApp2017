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
    
     //   scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let birthDate = getDateString()
        let gender = selectGender()
        let country = chosenCountry!
        let diabetes = selectDiabetes()
        
        //call the API and pass the above parameters to the function
        Network.callAPI(usingBirth: birthDate, andGender: gender, andCountry: country, andDiabetes: diabetes)
        
    }
    
    
    func getDateString() -> String {
        let components = datePicker.calendar.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: datePicker.date)
        let day = components.day!
        let mon = components.month!
        let year = components.year!
        return "\(day) \(month(from: mon)) \(year)"
    }
    
    func selectDiabetes() -> String {
        switch diabetesSelector.selectedSegmentIndex {
        case 0:
            return "diabetic"
        default:
            return "not diabetic"
        }
    }
    
    private func month(from value: Int) -> String {
        let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        return months[value - 1]
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
        if segue.identifier == "presentStateSegue" {
            if let destinationVC = segue.destination as? EMCCountryPickerController {
                destinationVC.countryDelegate = self
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
