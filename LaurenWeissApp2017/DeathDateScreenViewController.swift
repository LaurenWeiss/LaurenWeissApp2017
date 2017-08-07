//
//  DeathDateScreenViewController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/12/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AudioToolbox

class DeathDateScreenViewController: UIViewController {
   // var testDevices: [Any]! { get set }

    @IBOutlet weak var suggestionsButton: UIButton!
    
    @IBOutlet weak var ageOfDeathLabel: UILabel!
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    var deathAgeAsDouble: Double?

    @IBOutlet weak var update: UIButton!
    var deathAgeAsString: String = ""
    
    var currentSpec: LifeSpecs?
    var timer = Timer()
    var counter = 0
    
    
    
    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("Google Mobile Ads SDK version: \(GADRequest.sdkVersion())")
        
        bannerView.adUnitID = "ca-app-pub-2458339528814864/3542155153"
        bannerView.rootViewController = self

        
        ageOfDeathLabel.layer.cornerRadius = 10
        suggestionsButton.layer.cornerRadius = 10
        update.layer.cornerRadius = 10
        
        
        if deathAgeAsDouble != nil {
            deathAgeAsString = String(format: "%.2f", deathAgeAsDouble!)
            
            ageOfDeathLabel.text = deathAgeAsString
            
            
            ageOfDeathLabel.sizeToFit()
        }

        SuggestionsData.prepareSuggestions()
        
        
        let request = GADRequest()
      //  request.testDevices = [ kGADSimulatorID]
        bannerView.load(request)
        
        
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Start(sender: AnyObject) {
        counter = 28800
        countdownLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func onUpdate(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
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
