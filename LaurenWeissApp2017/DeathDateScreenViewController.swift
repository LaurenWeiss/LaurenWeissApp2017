//
//  DeathDateScreenViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit

class DeathDateScreenViewController: UIViewController {
    
    @IBOutlet weak var suggestionsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func suggestionsButtonTapped(_ sender: Any) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        
        self.performSegue(withIdentifier: Constants.Segue.toSuggsetionsScreenViewController, sender: self)
        
    }
}
