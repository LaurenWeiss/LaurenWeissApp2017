//
//  DrugAlcoholUseVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class DrugAlcoholUseVC: UIViewController, UIScrollViewDelegate {
    
    
   // @IBOutlet weak var smokeSelector: UISegmentedControl!
    
  //  @IBOutlet weak var packsOfSmokeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if smokeSelector.selectedSegmentIndex == 1 {
//            packsOfSmokeSelector.isEnabled = false
//        } else {
//            packsOfSmokeSelector.isEnabled = true
//        }
        
    }
    
//    @IBAction func smokeSelectorChanged(_ sender: UISegmentedControl) {
//        if smokeSelector.selectedSegmentIndex == 1 {
//            packsOfSmokeSelector.isEnabled = false
//        } else {
//            packsOfSmokeSelector.isEnabled = true
//        }
//    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }

    
}
