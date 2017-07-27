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
    }
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }
    
    //martial status info
    
    func selectMaritalStatus() {
        if single.isSelected {
            single.isEnabled = true
            single.backgroundColor = UIColor.green
        }
        if married.isSelected {
            married.isEnabled = true
            married.backgroundColor = UIColor.green
        }
        if widowed.isSelected {
            widowed.isEnabled = true
            widowed.backgroundColor = UIColor.green
        }
        if divorced.isSelected {
            divorced.isEnabled = true
            divorced.backgroundColor = UIColor.green
        }
        if tooYoungForMarriage.isSelected {
            tooYoungForMarriage.isEnabled = true
            tooYoungForMarriage.backgroundColor = UIColor.green
        }
    }
    
    
    //personal contact from family and friends info
    func selectContact(){
        if noContact.isSelected {
            noContact.isEnabled = true
            noContact.backgroundColor = UIColor.green
        }
        if contactFewTimesPerWeek.isSelected {
            contactFewTimesPerWeek.isEnabled = true
            contactFewTimesPerWeek.backgroundColor = UIColor.green
        }
        if contactMoreThanFewTimesPerWeek.isSelected {
            contactMoreThanFewTimesPerWeek.isEnabled = true
            contactMoreThanFewTimesPerWeek.backgroundColor = UIColor.green
        }
    }
    
    
    //heart attack info
    func selectHeartAttack(){
        if noHeartAttack.isSelected {
            noHeartAttack.isEnabled = true
            noHeartAttack.backgroundColor = UIColor.green
        }
        if yesHeartAttack.isSelected {
            yesHeartAttack.isEnabled = true
            yesHeartAttack.backgroundColor = UIColor.green
        }
    }
    
    //cancer in family info
    func cancerInfo(){
        if yesCancer.isSelected {
            yesCancer.isEnabled = true
            yesCancer.backgroundColor = UIColor.green
        }
        if noCancer.isSelected {
            noCancer.isEnabled = true
            noCancer.backgroundColor = UIColor.green
        }
        
    }
    
    //father info
    func fatherInfo(){
        if fatherIndependent.isSelected {
            fatherIndependent.isEnabled = true
            fatherIndependent.backgroundColor = UIColor.green
        }
        if fatherDeceased.isSelected {
            fatherDeceased.isEnabled = true
            fatherDeceased.backgroundColor = UIColor.green
        }
        if fatherDependent.isSelected {
            fatherDependent.isEnabled = true
            fatherDependent.backgroundColor = UIColor.green
        }
        
    }
    
    //mother info
    func motherInfo(){
        if motherIndependent.isSelected {
            motherIndependent.isEnabled = true
            motherIndependent.backgroundColor = UIColor.green
        }
        if motherDeceased.isSelected {
            motherDeceased.isEnabled = true
            motherDeceased.backgroundColor = UIColor.green
        }
        if motherDependent.isSelected {
            motherDependent.isEnabled = true
            motherDependent.backgroundColor = UIColor.green
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeathDate" {
            //            User.current.lifeSpecifications?.dob = datePicker.date
            //            User.current.lifeSpecifications?.sex = selectGender()
            //pass your age from lifeSpecs to destination
            //your destination has a container for that ready
            if let destinationVC = segue.destination as? DeathDateScreenViewController
            {
                destinationVC.deathAgeAsDouble = User.current.finalAge
            }
        }
    }
    
}
