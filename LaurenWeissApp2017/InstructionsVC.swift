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
        gotIt.layer.cornerRadius = 10
    }
}
