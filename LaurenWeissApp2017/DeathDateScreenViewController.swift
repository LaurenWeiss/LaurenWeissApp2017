//
//  DeathDateScreenViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit
import GoogleMobileAds


class DeathDateScreenViewController: UIViewController {
    
    //@IBOutlet weak var nativeExpressAdView: GADNativeExpressAdView!
    
    @IBOutlet weak var suggestionsButton: UIButton!
    
    @IBOutlet weak var ageOfDeathLabel: UILabel!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    var deathAgeAsDouble: Double?
    
    var deathAgeAsString: String = ""
    
    var currentSpec: LifeSpecs?
    var timer = Timer()
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
 
//        nativeExpressAdView.adUnitID = "ca-app-pub-2458339528814864~5497031975"
//        nativeExpressAdView.rootViewController = self
        
        let request = GADRequest()
        //nativeExpressAdView.load(request)
        
        
        if deathAgeAsDouble != nil {
            deathAgeAsString = String(format: "%.2f", deathAgeAsDouble!)
            
            ageOfDeathLabel.text = deathAgeAsString
            
            
            ageOfDeathLabel.sizeToFit()
        }

        SuggestionsData.prepareSuggestions()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Start(sender: AnyObject) {
        counter = 28800
        countdownLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    func updateTimer () {
        
        counter -= 1
        countdownLabel.text = String(counter)
        
    }
    
    @IBAction func Stop(sender: AnyObject) {
        
        timer.invalidate()
    }


    @IBAction func suggestionsButtonTapped(_ sender: Any) {
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
        
        self.performSegue(withIdentifier: Constants.Segue.toSuggsetionsScreenViewController, sender: self)
        
    }
    
}
