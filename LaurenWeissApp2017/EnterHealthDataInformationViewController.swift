//
//  EnterHealthDataInformationViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class EnterHealthDataInformationViewController: UIViewController {
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBOutlet weak var BirthdayLabel: UILabel!
    
    @IBOutlet weak var smokeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func DoYouSmoke(_ sender: Any) {
        
//        var tipPercentage = 0.0
//        
//        switch smokeSelector.selectedSegmentIndex {
//        case 0:
//            tipPercentage = Yes
//        case 1:
//            tipPercentage = No
//        default:
//            break
//        }

        
    }
    
}
