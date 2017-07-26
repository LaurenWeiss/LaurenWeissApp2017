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
    
    
    @IBOutlet weak var smokeSelector: UISegmentedControl!
    
    @IBOutlet weak var packsOfSmokeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if smokeSelector.selectedSegmentIndex == 1 {
            packsOfSmokeSelector.isEnabled = false
        } else {
            packsOfSmokeSelector.isEnabled = true
        }
        
    }
    
    @IBAction func smokeSelectorChanged(_ sender: UISegmentedControl) {
        if smokeSelector.selectedSegmentIndex == 1 {
            packsOfSmokeSelector.isEnabled = false
        } else {
            packsOfSmokeSelector.isEnabled = true
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        let isSmoking = smokeSelector.selectedSegmentIndex == 0 ? true : false
        
        APIManager.getResponse(usingBirth: birthDateString, andGender: sex, andCountry: country, ifIsSmoking: isSmoking) { (lifeSpecsForThisUser) in
            User.current.lifeSpecifications = lifeSpecsForThisUser
            User.current.lifeSpecifications!.numCigarettesPerDay = self.packsOfSmokeSelector.selectedSegmentIndex
            User.current.lifeSpecifications!.adjustLEBasedOnCigPacks()
            self.performSegue(withIdentifier: "toDeathDate", sender: self)
        }
    }

    
}
