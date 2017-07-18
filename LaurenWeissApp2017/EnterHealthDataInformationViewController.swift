//
//  EnterHealthDataInformationViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//
import Foundation
import UIKit

class EnterHealthDataInformationViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var smokeSelector: UISegmentedControl!
    @IBOutlet weak var genderSelector: UISegmentedControl!
    @IBOutlet weak var diabetesSelector: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
     //   scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let birthDate = getDateString()
        let gender = selectGender()
        let country = selectCountry()
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
    
    func selectCountry() -> String {
     
        return "hi"
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
    
    
}
