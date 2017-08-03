//
//  CustomSideMenuController.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 7/26/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import Foundation
import UIKit
import SideMenuController
class CustomSideMenuController: SideMenuController {
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "ShowCenterGeneral", sender: nil)
        performSegue(withIdentifier: "ShowSide", sender: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        SideMenuController.preferences.drawing.menuButtonImage = UIImage(named: "icons8-Menu-48")
        SideMenuController.preferences.drawing.sidePanelPosition = .overCenterPanelLeft
        SideMenuController.preferences.drawing.sidePanelWidth = 300
        SideMenuController.preferences.drawing.centerPanelShadow = true
        SideMenuController.preferences.animating.statusBarBehaviour = .showUnderlay
        SideMenuController.preferences.animating.transitionAnimator = FadeAnimator.self

        super.init(coder: aDecoder)
    }
}
