//
//  InstructionsVC.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 8/2/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation

import UIKit

class InstructionsVC: UIViewController {


    @IBOutlet weak var gotIt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = UIColor.primaryBlue
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for:.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        
        gotIt.layer.cornerRadius = 10
        
        //self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        //self.navigationController?.navigationBar.isTranslucent = true

    }
}
