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
    
    func singleSelected() {
        
    }
    func marriedSelected() {
        
    }
    func widowedSelected() {
        
    }
    func divorcedSelected() {
        
    }
    func tooYoungForMarriageSelected() {
        
    }
    
    
    //personal contact from family and friends info
    
    func noPersonalContactSelected() {
        
    }
    func contactFewTimesPerWeekSelected() {
        
    }
    func contactMoreThanFewTimesPerWeekSelected() {
        
    }
    
    
    //heart attack info
    func yesHeartAttackSelected() {
        
    }
    func noHeartAttackSelected() {
        
    }
    
    //cancer in family info
    func yesCancerSelected() {
        
    }
    func noCancerSelected() {
        
    }
    
    
    //father info
    func fatherDepedentSelected() {
        
    }
    func fatherIndependentSelected() {
        
    }
    func fatherDeceasedSelected() {
        
    }
    
    //mother info
    func motherDependentSelected() {
        
    }
    func motherIndependentSelected() {
        
    }
    func motherDeceasedSelected() {
        
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
