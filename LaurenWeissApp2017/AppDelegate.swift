//
//  AppDelegate.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/10/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit
import Firebase
import GoogleMobileAds


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
//LAURENWEISSAPP
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
//        configureInitialRootViewController(for: window)
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-2458339528814864~2645852364")
        
        let lifeSpecs = LifeSpecs()
        LifeSpecs.setGlobalLifeSpecs(lifeSpecs: lifeSpecs)

        //configure navigation bar style
        UINavigationBar.appearance().barTintColor = UIColor.primaryBlue
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for:.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        self.window?.backgroundColor = UIColor.primaryBlue
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

//
//extension AppDelegate {
//    func configureInitialRootViewController(for window: UIWindow?) {
//        let defaults = UserDefaults.standard
//        let initialViewController: UIViewController
//        
//        if Auth.auth().currentUser != nil,
//            let userData = defaults.object(forKey: Constants.UserDefaults.currentUser) as? Data,
//            let user = NSKeyedUnarchiver.unarchiveObject(with: userData) as? User {
//            
//            User.setCurrent(user)
//            
//            initialViewController = UIStoryboard.initialViewController(for: .main)
//        } else {
//            initialViewController = UIStoryboard.initialViewController(for: .login)
//        }
//        
//        window!.rootViewController = initialViewController
//        window!.makeKeyAndVisible()
//    }
//}
