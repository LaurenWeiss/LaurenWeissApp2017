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
    
    @IBOutlet weak var calculateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateButton.backgroundColor = UIColor.primaryBlue

        calculateButton.layer.cornerRadius = 10

        //making the buttons have rounded corners
        lowHDL.layer.cornerRadius = 10
        mediumHDL.layer.cornerRadius = 10
        highHDL.layer.cornerRadius = 10
        unknownHDL.layer.cornerRadius = 10
        
        lowLDL.layer.cornerRadius = 10
        mediumLDL.layer.cornerRadius = 10
        highLDL.layer.cornerRadius = 10
        unknownLDL.layer.cornerRadius = 10
        
        alwaysSunscreen.layer.cornerRadius = 10
        mostlyWearSunscreen.layer.cornerRadius = 10
        rarelySunscreen.layer.cornerRadius = 10
        sometimesWearSunscreen.layer.cornerRadius = 10
        
        yesScreenedCancer.layer.cornerRadius = 10
        noScreenedCancer.layer.cornerRadius = 10
        
        yesAnxiousDying.layer.cornerRadius = 10
        noAnxiousDying.layer.cornerRadius = 10
        
        //Calling Functions: SELECT HDL LEVELS
        if User.current.lifeSpecifications.hdlLevels == "low" {
            lowHDLSelected()
        } else if User.current.lifeSpecifications.hdlLevels == "medium" {
            mediumHDLSelected()
        } else if User.current.lifeSpecifications.hdlLevels == "high" {
            highHDLSelected()
        } else if User.current.lifeSpecifications.hdlLevels == "unknown" {
            unknownHDLSelected()
        }

        //Calling Functions: SELECT LDL LEVELS
        if User.current.lifeSpecifications.ldlLevels == "low" {
            lowLDLSelected()
        } else if User.current.lifeSpecifications.ldlLevels == "medium" {
            mediumLDLSelected()
        } else if User.current.lifeSpecifications.ldlLevels == "high" {
            highLDLSelected()
        } else if User.current.lifeSpecifications.ldlLevels == "unknown" {
            unknownLDLSelected()
        }
        
        //Calling Functions: SELECT SUN PROTECTION
        if User.current.lifeSpecifications.sunProtectionInfo == "alwaysSunscreenSelected" {
            alwaysSunscreenSelected()
        } else if User.current.lifeSpecifications.sunProtectionInfo == "mostOfTheTimeSunscreen" {
            mostOfTheTimeSunscreen()
        } else if User.current.lifeSpecifications.sunProtectionInfo == "sometimesSunscreen" {
            sometimesSunscreen()
        } else if User.current.lifeSpecifications.sunProtectionInfo == "rarelySunscreenSelected" {
        rarelySunscreenSelected()
        }
            
        //Calling Functions: SELECT HOW OFTEN SCREENED FOR CANCER
        if User.current.lifeSpecifications.cancerScreeningInfo == "noCancerScreeningSelected" {
            noCancerScreeningSelected()
        } else if User.current.lifeSpecifications.cancerScreeningInfo == "yesCancerScreeningSelected" {
            yesCancerScreeningSelected()
        }
        
        //Calling Functions: SELECT ANXIETY ABOUT DYING
        if User.current.lifeSpecifications.anxietyAboutDying == "yesAnxietyDeath" {
            yesAnxietyDeath()
        } else if User.current.lifeSpecifications.anxietyAboutDying == "noAnxietyDeath" {
            noAnxietyDeath()
        }
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = Int(finalAge)
        }
        
    }
    
    //HDL info
    
    @IBAction func selectHDLInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            lowHDLSelected()
        } else if sender.tag == 1 {
            mediumHDLSelected()
        } else if sender.tag == 2 {
            highHDLSelected()
        }
        else if sender.tag == 3 {
            unknownHDLSelected()
        }
    }
    
    func lowHDLSelected(){
        lowHDL.backgroundColor = UIColor.primaryBlue
        lowHDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.hdlLevels = "low"
        
        mediumHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumHDL.backgroundColor = UIColor.clear
        
        highHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highHDL.backgroundColor = UIColor.clear
        
        unknownHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownHDL.backgroundColor = UIColor.clear
    }
    func mediumHDLSelected(){
        mediumHDL.backgroundColor = UIColor.primaryBlue
        mediumHDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.hdlLevels = "medium"
        
        lowHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowHDL.backgroundColor = UIColor.clear
        
        highHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highHDL.backgroundColor = UIColor.clear
        
        unknownHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownHDL.backgroundColor = UIColor.clear
        
    }
    func highHDLSelected() {
        highHDL.backgroundColor = UIColor.primaryBlue
        highHDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.hdlLevels = "high"
        
        mediumHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumHDL.backgroundColor = UIColor.clear
        
        lowHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowHDL.backgroundColor = UIColor.clear
        
        unknownHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownHDL.backgroundColor = UIColor.clear
    }
    func unknownHDLSelected() {
        unknownHDL.backgroundColor = UIColor.primaryBlue
        unknownHDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.hdlLevels = "unknown"
        
        mediumHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumHDL.backgroundColor = UIColor.clear
        
        lowHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowHDL.backgroundColor = UIColor.clear
        
        highHDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highHDL.backgroundColor = UIColor.clear
        
    }
    
    
    //LDL info
    @IBAction func selectLDLInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            lowLDLSelected()
        } else if sender.tag == 1 {
            mediumLDLSelected()
        } else if sender.tag == 2 {
            highLDLSelected()
        }
        else if sender.tag == 3 {
            unknownLDLSelected()
        }
    }
    
    
    func lowLDLSelected(){
        lowLDL.backgroundColor = UIColor.primaryBlue
        lowLDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.ldlLevels = "low"
        
        mediumLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumLDL.backgroundColor = UIColor.clear
        
        highLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highLDL.backgroundColor = UIColor.clear
        
        unknownLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownLDL.backgroundColor = UIColor.clear
    }
    func mediumLDLSelected() {
        mediumLDL.backgroundColor = UIColor.primaryBlue
        mediumLDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.ldlLevels = "medium"
        
        lowLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowLDL.backgroundColor = UIColor.clear
        
        highLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highLDL.backgroundColor = UIColor.clear
        
        unknownLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownLDL.backgroundColor = UIColor.clear
        
    }
    
    func highLDLSelected() {
        highLDL.backgroundColor = UIColor.primaryBlue
        highLDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.ldlLevels = "high"
        
        mediumLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumLDL.backgroundColor = UIColor.clear
        
        lowLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowLDL.backgroundColor = UIColor.clear
        
        unknownLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        unknownLDL.backgroundColor = UIColor.clear
    }
    func unknownLDLSelected() {
        unknownLDL.backgroundColor = UIColor.primaryBlue
        unknownLDL.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.ldlLevels = "unknown"
        
        mediumLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        mediumLDL.backgroundColor = UIColor.clear
        
        highLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        highLDL.backgroundColor = UIColor.clear
        
        lowLDL.setTitleColor(UIColor.primaryBlue, for: .normal)
        lowLDL.backgroundColor = UIColor.clear
    }
    
    
    //sunscreen info
    
    @IBAction func selectSunscreenInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            alwaysSunscreenSelected()
        } else if sender.tag == 1 {
            mostOfTheTimeSunscreen()
        } else if sender.tag == 2 {
            sometimesSunscreen()
        }
        else if sender.tag == 3 {
            rarelySunscreenSelected()
        }
    }
    
    func alwaysSunscreenSelected(){
        alwaysSunscreen.backgroundColor = UIColor.primaryBlue
        alwaysSunscreen.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sunProtectionInfo = "alwaysSunscreenSelected"
        
        mostlyWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        mostlyWearSunscreen.backgroundColor = UIColor.clear
        
        sometimesWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        sometimesWearSunscreen.backgroundColor = UIColor.clear
        
        rarelySunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelySunscreen.backgroundColor = UIColor.clear
        
    }
    func mostOfTheTimeSunscreen(){
        mostlyWearSunscreen.backgroundColor = UIColor.primaryBlue
        mostlyWearSunscreen.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sunProtectionInfo = "mostOfTheTimeSunscreen"
        
        alwaysSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        alwaysSunscreen.backgroundColor = UIColor.clear
        
        sometimesWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        sometimesWearSunscreen.backgroundColor = UIColor.clear
        
        rarelySunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelySunscreen.backgroundColor = UIColor.clear
    }
    func sometimesSunscreen() {
        sometimesWearSunscreen.backgroundColor = UIColor.primaryBlue
        sometimesWearSunscreen.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sunProtectionInfo = "sometimesSunscreen"
        
        mostlyWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        mostlyWearSunscreen.backgroundColor = UIColor.clear
        
        alwaysSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        alwaysSunscreen.backgroundColor = UIColor.clear
        
        rarelySunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        rarelySunscreen.backgroundColor = UIColor.clear
    }
    func rarelySunscreenSelected() {
        rarelySunscreen.backgroundColor = UIColor.primaryBlue
        rarelySunscreen.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.sunProtectionInfo = "rarelySunscreenSelected"
        
        mostlyWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        mostlyWearSunscreen.backgroundColor = UIColor.clear
        
        sometimesWearSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        sometimesWearSunscreen.backgroundColor = UIColor.clear
        
        alwaysSunscreen.setTitleColor(UIColor.primaryBlue, for: .normal)
        alwaysSunscreen.backgroundColor = UIColor.clear
    }
    
    //cancer screening info
    
    @IBAction func selectCancerScreeningInfo(_ sender: UIButton) {
        if sender.tag == 0 {
            noCancerScreeningSelected()
        } else if sender.tag == 1 {
            yesCancerScreeningSelected()
        }
    }
    
    func noCancerScreeningSelected(){
        noScreenedCancer.backgroundColor = UIColor.primaryBlue
        noScreenedCancer.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.cancerScreeningInfo = "noCancerScreeningSelected"
        
        yesScreenedCancer.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesScreenedCancer.backgroundColor = UIColor.clear
    }
    func yesCancerScreeningSelected() {
        yesScreenedCancer.backgroundColor = UIColor.primaryBlue
        yesScreenedCancer.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.cancerScreeningInfo = "yesCancerScreeningSelected"
        
        noScreenedCancer.setTitleColor(UIColor.primaryBlue, for: .normal)
        noScreenedCancer.backgroundColor = UIColor.clear
    }
    
    //anxiety about death info
    @IBAction func selectAnxietyAboutDeath(_ sender: UIButton) {
        if sender.tag == 0 {
            yesAnxietyDeath()
        } else if sender.tag == 1 {
            noAnxietyDeath()
        }
    }
    
    func yesAnxietyDeath(){
        yesAnxiousDying.backgroundColor = UIColor.primaryBlue
        yesAnxiousDying.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.anxietyAboutDying = "yesAnxietyDeath"
        
        noAnxiousDying.setTitleColor(UIColor.primaryBlue, for: .normal)
        noAnxiousDying.backgroundColor = UIColor.clear
    }
    func noAnxietyDeath() {
        noAnxiousDying.backgroundColor = UIColor.primaryBlue
        noAnxiousDying.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.anxietyAboutDying = "noAnxietyDeath"
        
        yesAnxiousDying.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesAnxiousDying.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeathDate" {
            
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsInt = User.current.finalAge
            }
        }
    }
    
}
