//
//  MenuController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let segues = ["ShowCenterGeneral", "ShowCenterDaily", "ShowCenterRelationships", "ShowCenterDrugs", "ShowCenterDiet", "ShowCenterOther" ]
    let menuOptionLabels = ["General Information", "Daily Life", "Relationships", "Drug/Alcohol Use", "Diet and Nutrition", "Other Health Information"]
    private var previousIndex: NSIndexPath?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var signOutTableView: UITableView!
    
    // MARK: - Properties
    
    var user: User!
    // MARK: - Properties
    var authHandle: AuthStateDidChangeListenerHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.navigationController.navigationBar.translucent = false

        
        tableView.dataSource = self
        tableView.delegate = self
        
//        signOutTableView.dataSource = self
//        signOutTableView.delegate = self
//        
//        
//        user = user ?? User.current
//        
//        authHandle = Auth.auth().addStateDidChangeListener() { [unowned self] (auth, user) in
//            guard user == nil else { return }
//            
//            let loginViewController = UIStoryboard.initialViewController(for: .login)
//            self.view.window?.rootViewController = loginViewController
//            self.view.window?.makeKeyAndVisible()
//        }
//
//        
//    }
//    
//    deinit {
//        if let authHandle = authHandle {
//            Auth.auth().removeStateDidChangeListener(authHandle)
//        }
//    }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRows = 0
        
        if tableView == tableView {
            numberOfRows = segues.count
        }
        
//        if tableView == signOutTableView {
//            numberOfRows = 1
//        }
//        
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! CategoryCell
        
        if tableView == tableView {
            cell.categoryLabel.text = menuOptionLabels[indexPath.row]
        }
        
//        if tableView == signOutTableView {
//            cell.categoryLabel.text = "Sign Out"
//        }
        return cell

    }
    
    func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath)  {
        
        if tableView == tableView {
            if let index = previousIndex {
                tableView.deselectRow(at: index as IndexPath, animated: true)
            }
            
            sideMenuController?.performSegue(withIdentifier: segues[indexPath.row], sender: nil)
            previousIndex = indexPath as NSIndexPath?
        }
        
        if tableView == signOutTableView {
            do {
                try Auth.auth().signOut()
            } catch let error as NSError {
                assertionFailure("Error signing out: \(error.localizedDescription)")
            }
        }
        

}
}
