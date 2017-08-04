//
//  AboutScreenVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 8/4/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit
class AboutScreenVC: UIViewController {
  
    @IBOutlet weak var gotItButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        gotItButton.layer.cornerRadius = 10
    }

    
    @IBAction func onGotit(_ sender: Any) {
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    

    
}
