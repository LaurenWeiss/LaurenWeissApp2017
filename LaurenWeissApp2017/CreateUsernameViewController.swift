//
//  CreateUsernameViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/11/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    // MARK: - Subviews
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
            super.viewDidLoad()
        nextButton.layer.cornerRadius = 6
    }
    
    // MARK: - IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            //Move to Main.storyboard -> main features
 
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let initialViewController = storyboard.instantiateInitialViewController()
            let window = UIWindow()
            window.rootViewController = initialViewController
            window.makeKeyAndVisible()
            
        }
    }

}

//@IBAction func suggestionsButtonTapped(_ sender: Any) {
//    
//    let initialViewController = UIStoryboard.initialViewController(for: .main)
//    self.view.window?.rootViewController = initialViewController
//    self.view.window?.makeKeyAndVisible()
//    
//    self.performSegue(withIdentifier: Constants.Segue.toSuggsetionsScreenViewController, sender: self)
//    
//}
