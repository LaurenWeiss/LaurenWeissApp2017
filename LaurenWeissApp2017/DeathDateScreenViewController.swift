//
//  DeathDateScreenViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit

class DeathDateScreenViewController: UIViewController {
    
    @IBOutlet weak var suggestionsButton: UIButton!
    
    @IBOutlet weak var ageOfDeathLabel: UILabel!
    
    var deathAge: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show ageOfDeath
        
        
       // var ageOfDeath: String = LifeExpectancy.shared.yearsLeft + LifeExpectancy.shared.currentAge
        ageOfDeathLabel.text = LifeExpectancy
        
        
      //  ageOfDeathLabel.text = JSONParser.parse(yearsLeft)
        ageOfDeathLabel.sizeToFit()
//        print("\(LifeExpectancy.shared.yearsLeft)\"hi")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func suggestionsButtonTapped(_ sender: Any) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        
        self.performSegue(withIdentifier: Constants.Segue.toSuggsetionsScreenViewController, sender: self)
        
    }
    
}
