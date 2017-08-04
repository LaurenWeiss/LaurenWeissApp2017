//
//  CreateUsernameViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/11/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
////
//import UIKit
//import FirebaseAuth
//import FirebaseDatabase
//
//class CreateUsernameViewController: UIViewController {
//    
//    // MARK: - Subviews
//    
//    @IBOutlet weak var usernameTextField: UITextField!
//    @IBOutlet weak var nextButton: UIButton!
//    
//    @IBOutlet weak var createUsernameLabel: UILabel!
//    // MARK: - VC Lifecycle
//    
//    override func viewDidLoad() {
//            super.viewDidLoad()
//        nextButton.layer.cornerRadius = 10
//        createUsernameLabel.clipsToBounds = true
//        createUsernameLabel.layer.cornerRadius = 10
//    }
//    
//    // MARK: - IBActions
//    
//    @IBAction func nextButtonTapped(_ sender: Any) {
//        
//        guard let firUser = Auth.auth().currentUser,
//            let username = usernameTextField.text,
//            !username.isEmpty else { return }
//        
//        UserService.create(firUser, username: username) { (user) in
//            guard let user = user else {
//                // handle error
//                return
//            }
//            
//            User.setCurrent(user, writeToUserDefaults: true)
//            //Move to Main.storyboard -> main features
//            
//            
//            let initialViewController = UIStoryboard.initialViewController(for: .main)
//            let  appDelegate = UIApplication.shared.delegate  as! AppDelegate
//            appDelegate.window!.rootViewController = initialViewController
//            appDelegate.window!.makeKeyAndVisible()
//        }
//    }
//}
