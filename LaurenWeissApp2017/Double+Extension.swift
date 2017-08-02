//
//  Double+Extensio.swift
//  LaurenWeissApp2017
//
//  Created by Lauren Weiss on 8/2/17.
//  Copyright © 2017 Lauren Weiss. All rights reserved.
//

import UIKit

extension Double {
    
    mutating func rounded() -> Double {
        return Darwin.round(self * 100) / 100
    }
}
