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
    
    
    var deathAgeAsDouble: Double?
    
    var deathAgeAsString: String = ""
    
    var currentSpec: LifeSpecs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if deathAgeAsDouble != nil {
            deathAgeAsString = String(format: "%.2f", deathAgeAsDouble!)
            
            ageOfDeathLabel.text = deathAgeAsString
            
            
            ageOfDeathLabel.sizeToFit()
        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func suggestionsButtonTapped(_ sender: Any) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        
        self.performSegue(withIdentifier: Constants.Segue.toSuggsetionsScreenViewController, sender: self)
        
    }
    
}
