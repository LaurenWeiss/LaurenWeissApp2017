//
//  LoginViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/11/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var lifELabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var xpectancyLabel: UILabel!
    
    
    @IBOutlet weak var aboutButton: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 10
        aboutButton.layer.cornerRadius = 10
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    // MARK: - VC Lifecycle

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        lifELabel.center.y -= view.bounds.width
//        xpectancyLabel.center.y -= view.bounds.width
//
//    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0, animations: {
//            self.lifELabel.center.y += self.view.bounds.width
//        })
//        UIView.animate(withDuration: 4.0, animations: {
//            self.xpectancyLabel.center.y += self.view.bounds.width
//        })
//    }
    
    // MARK: - IBActions
    
//    @IBAction func loginButtonTapped(_ sender: UIButton) {
//        print("log in button tapped")
//        
//        guard let authUI = FUIAuth.defaultAuthUI()
//            else { return }
//        
//        // 2
//        authUI.delegate = self
//        
//        // 3
//        let authViewController = authUI.authViewController()
//        present(authViewController, animated: true)
//    }
}

/*
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let _ = error {
            //assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        guard let user = user
            else { return }
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
    }
}
 */
