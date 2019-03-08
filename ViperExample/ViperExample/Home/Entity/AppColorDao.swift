//
//  AppColorDao.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

class AppColorDao{
    func save(rgb:(CGFloat,CGFloat,CGFloat)) -> (Void){
        UserDefaults.standard.set(rgb.0, forKey: "Red")
        UserDefaults.standard.set(rgb.1, forKey: "Green")
        UserDefaults.standard.set(rgb.2, forKey: "Blue")
    }
    func load() -> (CGFloat,CGFloat,CGFloat){
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        
        return (red,green,blue)
    }
}
