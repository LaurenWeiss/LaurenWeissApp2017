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
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Calling Functions: SELECT WHETHER OR NOT YOU SMOKE
        
        //Calling Functions: SELECT NUMBER OF CIGARETTE PACKS SMOKED PER DAY
        
        //Calling Functions: SELECT SECOND-HAND SMOKING EXPOSURE
        
        //Calling Functions: SELECT WHETHER OR NOT YOU DRINK ALCOHOL
        
        //Calling Functions: SELECT NUM NIGHTS SPENT DRINKING
        
        //Calling Functions: SELECT HOW NUM DRINKS YOU HAVE IN ONE NIGHT OF DRINKING ALCOHOL
        
        //Calling Functions: SELECT WHETHER OR NOT YOU TAKE ILLEGAL DRUGS
    
        
    }
    
        
        
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        LifeExpectancyCalculator.calculateAge(forUser: User.current) { (finalAge) in
            User.current.finalAge = finalAge
        }
        
    }

    
}
