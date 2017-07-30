//
//  RelationshipsVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class RelationshipsVC: UIViewController, UIScrollViewDelegate {
    
    //martial status info
    
    @IBOutlet weak var single: UIButton!
    @IBOutlet weak var widowed: UIButton!
    @IBOutlet weak var married: UIButton!
    @IBOutlet weak var divorced: UIButton!
    @IBOutlet weak var tooYoungForMarriage: UIButton!
    
    //personal contact from family and friends info
    
    @IBOutlet weak var noContact: UIButton!
    @IBOutlet weak var contactFewTimesPerWeek: UIButton!
    @IBOutlet weak var contactMoreThanFewTimesPerWeek: UIButton!
    
    //heart attack info
    
    @IBOutlet weak var yesHeartAttack: UIButton!
    @IBOutlet weak var noHeartAttack: UIButton!
    
    //cancer in family info
    
    @IBOutlet weak var yesCancer: UIButton!
    @IBOutlet weak var noCancer: UIButton!
    
    //father info
    
    @IBOutlet weak var fatherDependent: UIButton!
    @IBOutlet weak var fatherIndependent: UIButton!
    @IBOutlet weak var fatherDeceased: UIButton!
    
    
    //mother info
    
    @IBOutlet weak var motherDependent: UIButton!
    @IBOutlet weak var motherIndependent: UIButton!
    @IBOutlet weak var motherDeceased: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //making the buttons have rounded corners
        
        single.layer.cornerRadius = 10
        widowed.layer.cornerRadius = 10
        married.layer.cornerRadius = 10
        divorced.layer.cornerRadius = 10
        tooYoungForMarriage.layer.cornerRadius = 10
        
        noContact.layer.cornerRadius = 10
        contactFewTimesPerWeek.layer.cornerRadius = 10
        contactMoreThanFewTimesPerWeek.layer.cornerRadius = 10
        
        yesHeartAttack.layer.cornerRadius = 10
        noHeartAttack.layer.cornerRadius = 10
        
        yesCancer.layer.cornerRadius = 10
        noCancer.layer.cornerRadius = 10
        
        fatherDependent.layer.cornerRadius = 10
        fatherIndependent.layer.cornerRadius = 10
        fatherDeceased.layer.cornerRadius = 10
        
        motherIndependent.layer.cornerRadius = 10
        motherDeceased.layer.cornerRadius = 10
        motherDependent.layer.cornerRadius = 10
        
        //Calling Functions: SELECT MARITAL STATUS
        if User.current.lifeSpecifications.maritalStatus == "single" {
            singleSelected()
        } else if User.current.lifeSpecifications.maritalStatus == "married" {
            marriedSelected()
        } else if User.current.lifeSpecifications.maritalStatus == "widowed" {
            widowedSelected()
        } else if User.current.lifeSpecifications.maritalStatus == "divorced" {
            divorcedSelected()
        } else if User.current.lifeSpecifications.maritalStatus == "too young to be married" {
            tooYoungForMarriageSelected()
        }
       
        //Calling Functions: SELECT PERSONAL CONTACT FROM FAMILY AND FRIENDS
        if User.current.lifeSpecifications.personalContact == "rare personal contact" {
            noPersonalContactSelected()
        } else if User.current.lifeSpecifications.personalContact == "contact few times per week" {
            contactFewTimesPerWeekSelected()
        } else if User.current.lifeSpecifications.personalContact == "contact more than few times per week" {
            contactMoreThanFewTimesPerWeekSelected()
        }
        
        //Calling Functions: SELECT HEART ATTACK 
        if User.current.lifeSpecifications.heartAttack == "yes" {
            yesHeartAttackSelected()
        } else if User.current.lifeSpecifications.heartAttack == "no" {
            noHeartAttackSelected()
        }
        
        //Calling Functions: SELECT IF CANCER RUNS IN FAMILY
        if User.current.lifeSpecifications.cancerRun == "yes" {
            yesCancerSelected()
        } else if User.current.lifeSpecifications.cancerRun == "no" {
            noCancerSelected()
        }
        
        //Calling Functions: SELECT FATHER DEPENDENCY
        if User.current.lifeSpecifications.fatherDependency == "dependent" {
            fatherDepedentSelected()
        } else if User.current.lifeSpecifications.fatherDependency == "deceased" {
            fatherDeceasedSelected()
        } else if User.current.lifeSpecifications.fatherDependency == "independent" {
            fatherIndependentSelected()
        }
        
        //Calling Functions: SELECT MOTHER DEPENDENCY
        if User.current.lifeSpecifications.motherDependency == "dependent" {
            motherDependentSelected()
        } else if User.current.lifeSpecifications.motherDependency == "independent" {
            motherIndependentSelected()
        } else if User.current.lifeSpecifications.motherDependency == "deceased" {
            motherDeceasedSelected()
        }
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //martial status info
    
    @IBAction func selectMaritalStatus(_ sender: UIButton) {
        if sender.tag == 100 {
            singleSelected()
        } else if sender.tag == 101 {
            marriedSelected()
        } else if sender.tag == 102 {
            widowedSelected()
        } else if sender.tag == 103 {
            divorcedSelected()
        } else if sender.tag == 104 {
            tooYoungForMarriageSelected()
        }
    }
    
    
    func singleSelected() {
        single.backgroundColor = UIColor.primaryBlue
        single.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.maritalStatus = "single"
        
        married.setTitleColor(UIColor.primaryBlue, for: .normal)
        married.backgroundColor = UIColor.clear
        
        widowed.setTitleColor(UIColor.primaryBlue, for: .normal)
        widowed.backgroundColor = UIColor.clear
        
        divorced.setTitleColor(UIColor.primaryBlue, for: .normal)
        divorced.backgroundColor = UIColor.clear
        
        tooYoungForMarriage.setTitleColor(UIColor.primaryBlue, for: .normal)
        tooYoungForMarriage.backgroundColor = UIColor.clear

        
    }
    func marriedSelected() {
        married.backgroundColor = UIColor.primaryBlue
        married.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.maritalStatus = "married"
        
        single.setTitleColor(UIColor.primaryBlue, for: .normal)
        single.backgroundColor = UIColor.clear
        
        widowed.setTitleColor(UIColor.primaryBlue, for: .normal)
        widowed.backgroundColor = UIColor.clear
        
        divorced.setTitleColor(UIColor.primaryBlue, for: .normal)
        divorced.backgroundColor = UIColor.clear
        
        tooYoungForMarriage.setTitleColor(UIColor.primaryBlue, for: .normal)
        tooYoungForMarriage.backgroundColor = UIColor.clear
        
        
    }
    func widowedSelected() {
        widowed.backgroundColor = UIColor.primaryBlue
        widowed.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.maritalStatus = "widowed"
        
        single.setTitleColor(UIColor.primaryBlue, for: .normal)
        single.backgroundColor = UIColor.clear
        
        married.setTitleColor(UIColor.primaryBlue, for: .normal)
        married.backgroundColor = UIColor.clear
        
        divorced.setTitleColor(UIColor.primaryBlue, for: .normal)
        divorced.backgroundColor = UIColor.clear
        
        tooYoungForMarriage.setTitleColor(UIColor.primaryBlue, for: .normal)
        tooYoungForMarriage.backgroundColor = UIColor.clear
    }
    func divorcedSelected() {
        divorced.backgroundColor = UIColor.primaryBlue
        divorced.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.maritalStatus = "divorced"
        
        single.setTitleColor(UIColor.primaryBlue, for: .normal)
        single.backgroundColor = UIColor.clear
        
        married.setTitleColor(UIColor.primaryBlue, for: .normal)
        married.backgroundColor = UIColor.clear
        
        widowed.setTitleColor(UIColor.primaryBlue, for: .normal)
        widowed.backgroundColor = UIColor.clear
        
        tooYoungForMarriage.setTitleColor(UIColor.primaryBlue, for: .normal)
        tooYoungForMarriage.backgroundColor = UIColor.clear
        
    }
    func tooYoungForMarriageSelected() {
        tooYoungForMarriage.backgroundColor = UIColor.primaryBlue
        tooYoungForMarriage.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.maritalStatus = "too young to be married"
        
        single.setTitleColor(UIColor.primaryBlue, for: .normal)
        single.backgroundColor = UIColor.clear
        
        married.setTitleColor(UIColor.primaryBlue, for: .normal)
        married.backgroundColor = UIColor.clear
        
        widowed.setTitleColor(UIColor.primaryBlue, for: .normal)
        widowed.backgroundColor = UIColor.clear
        
        divorced.setTitleColor(UIColor.primaryBlue, for: .normal)
        divorced.backgroundColor = UIColor.clear
        
    }
    
    
    //personal contact from family and friends info
    
    @IBAction func selectContact(_ sender: UIButton) {
        if sender.tag == 100 {
            noPersonalContactSelected()
        } else if sender.tag == 101 {
            contactFewTimesPerWeekSelected()
        } else if sender.tag == 102 {
            contactMoreThanFewTimesPerWeekSelected()
        }
    }
    
    
    func noPersonalContactSelected() {
        noContact.backgroundColor = UIColor.primaryBlue
        noContact.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.personalContact = "rare personal contact"
        
        contactFewTimesPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        contactFewTimesPerWeek.backgroundColor = UIColor.clear
        
        contactMoreThanFewTimesPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        contactMoreThanFewTimesPerWeek.backgroundColor = UIColor.clear
        
    }
    func contactFewTimesPerWeekSelected() {
        contactFewTimesPerWeek.backgroundColor = UIColor.primaryBlue
        contactFewTimesPerWeek.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.personalContact = "contact few times per week"
        
        contactMoreThanFewTimesPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        contactMoreThanFewTimesPerWeek.backgroundColor = UIColor.clear
        
        noContact.setTitleColor(UIColor.primaryBlue, for: .normal)
        noContact.backgroundColor = UIColor.clear
        
    }
    func contactMoreThanFewTimesPerWeekSelected() {
        contactMoreThanFewTimesPerWeek.backgroundColor = UIColor.primaryBlue
        contactMoreThanFewTimesPerWeek.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.personalContact = "contact more than few times per week"
        
        contactFewTimesPerWeek.setTitleColor(UIColor.primaryBlue, for: .normal)
        contactFewTimesPerWeek.backgroundColor = UIColor.clear
        
        noContact.setTitleColor(UIColor.primaryBlue, for: .normal)
        noContact.backgroundColor = UIColor.clear
    }
    
    
    //heart attack info
    @IBAction func selectHeartAttack(_ sender: UIButton) {
        if sender.tag == 100 {
            yesHeartAttackSelected()
        } else if sender.tag == 101 {
            noHeartAttackSelected()
        }
    }
    
    func yesHeartAttackSelected() {
        yesHeartAttack.backgroundColor = UIColor.primaryBlue
        yesHeartAttack.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.heartAttack = "yes"
        
        noHeartAttack.setTitleColor(UIColor.primaryBlue, for: .normal)
        noHeartAttack.backgroundColor = UIColor.clear
        
    }
    func noHeartAttackSelected() {
        noHeartAttack.backgroundColor = UIColor.primaryBlue
        noHeartAttack.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.heartAttack = "no"
        
        yesHeartAttack.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesHeartAttack.backgroundColor = UIColor.clear
        
    }
    
    //cancer in family info
    
    @IBAction func selectCancerRun(_ sender: UIButton) {
        if sender.tag == 100 {
            yesCancerSelected()
        } else if sender.tag == 101 {
            noCancerSelected()
        }
    }
    
    func yesCancerSelected() {
        yesCancer.backgroundColor = UIColor.primaryBlue
        yesCancer.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.cancerRun = "yes"
        
        noCancer.setTitleColor(UIColor.primaryBlue, for: .normal)
        noCancer.backgroundColor = UIColor.clear
    }
    func noCancerSelected() {
        noCancer.backgroundColor = UIColor.primaryBlue
        noCancer.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.cancerRun = "no"
        
        yesCancer.setTitleColor(UIColor.primaryBlue, for: .normal)
        yesCancer.backgroundColor = UIColor.clear
    }
    
    
    //father info

    
    @IBAction func selectFatherDependency(_ sender: UIButton) {
        
        if sender.tag == 100 {
            fatherDepedentSelected()
        } else if sender.tag == 101 {
            fatherIndependentSelected()
        } else if sender.tag == 102 {
            fatherDeceasedSelected()
        }
    }
    
    func fatherDepedentSelected() {
        fatherDependent.backgroundColor = UIColor.primaryBlue
        fatherDependent.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fatherDependency = "dependent"
        
        fatherDeceased.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherDeceased.backgroundColor = UIColor.clear
        
        fatherIndependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherIndependent.backgroundColor = UIColor.clear
    }
    func fatherIndependentSelected() {
        fatherIndependent.backgroundColor = UIColor.primaryBlue
        fatherIndependent.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fatherDependency = "independent"
        
        fatherDeceased.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherDeceased.backgroundColor = UIColor.clear
        
        fatherDependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherDependent.backgroundColor = UIColor.clear
        
    }
    func fatherDeceasedSelected() {
        fatherDeceased.backgroundColor = UIColor.primaryBlue
        fatherDeceased.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.fatherDependency = "deceased"
        
        fatherIndependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherIndependent.backgroundColor = UIColor.clear
        
        fatherDependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        fatherDependent.backgroundColor = UIColor.clear
    }
    
    //mother info
    @IBAction func selectMotherDependency(_ sender: UIButton) {
        if sender.tag == 100 {
            motherDependentSelected()
        } else if sender.tag == 101 {
            motherIndependentSelected()
        } else if sender.tag == 102 {
            motherDeceasedSelected()
        }
    }
    
    func motherDependentSelected() {
        motherDependent.backgroundColor = UIColor.primaryBlue
        motherDependent.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.motherDependency = "dependent"
        
        motherDeceased.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherDeceased.backgroundColor = UIColor.clear
        
        motherIndependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherIndependent.backgroundColor = UIColor.clear
    }
    func motherIndependentSelected() {
        motherIndependent.backgroundColor = UIColor.primaryBlue
        motherIndependent.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.motherDependency = "independent"
        
        motherDeceased.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherDeceased.backgroundColor = UIColor.clear
        
        motherDependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherDependent.backgroundColor = UIColor.clear
        
    }
    func motherDeceasedSelected() {
        motherDeceased.backgroundColor = UIColor.primaryBlue
        motherDeceased.setTitleColor(UIColor.white, for: .normal)
        User.current.lifeSpecifications.motherDependency = "deceased"
        
        motherIndependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherIndependent.backgroundColor = UIColor.clear
        
        motherDependent.setTitleColor(UIColor.primaryBlue, for: .normal)
        motherDependent.backgroundColor = UIColor.clear
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeathDate" {
            
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = User.current.finalAge
            }
        }
    }
    
}
