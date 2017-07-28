//
//  OtherHealthInfoVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class OtherHealthInfoVC: UIViewController, UIScrollViewDelegate {
    
    
    //HDL info
    @IBOutlet weak var lowHDL: UIButton!
    @IBOutlet weak var mediumHDL: UIButton!
    @IBOutlet weak var highHDL: UIButton!
    @IBOutlet weak var unknownHDL: UIButton!
    
    //LDL info
    @IBOutlet weak var lowLDL: UIButton!
    @IBOutlet weak var mediumLDL: UIButton!
    @IBOutlet weak var highLDL: UIButton!
    @IBOutlet weak var unknownLDL: UIButton!
    
    //sunscreen info
    @IBOutlet weak var alwaysSunscreen: UIButton!
    @IBOutlet weak var mostlyWearSunscreen: UIButton!
    @IBOutlet weak var rarelySunscreen: UIButton!
    @IBOutlet weak var sometimesWearSunscreen: UIButton!
    
    //cancer screening info
    @IBOutlet weak var yesScreenedCancer: UIButton!
    @IBOutlet weak var noScreenedCancer: UIButton!
    
    //anxiety about death info
    @IBOutlet weak var yesAnxiousDying: UIButton!
    @IBOutlet weak var noAnxiousDying: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling Functions: SELECT HDL LEVELS
        
        //Calling Functions: SELECT LDL LEVELS
        
        //Calling Functions: SELECT SUN PROTECTION
        
        //Calling Functions: SELECT HOW OFTEN SCREENED FOR CANCER
        
        //Calling Functions: SELECT ANXIETY ABOUT DYING
        
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //HDL info
    func selectHDL(){
        
    }
    
    
    //LDL info
    func selectLDL(){
        
    }
    
    //sunscreen info
    func selectSunscreen(){
        
    }
    
    //cancer screening info
    func selectCancer(){
        
    }
    
    //anxiety about death info
    func selectAnxiety(){
        
    }
    
}
