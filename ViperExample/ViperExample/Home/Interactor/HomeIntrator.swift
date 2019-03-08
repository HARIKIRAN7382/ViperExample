//
//  HomeIntrator.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

class HomeInteractor: HomeUseCase{
    func saveCurrentColor(rgb:(CGFloat,CGFloat,CGFloat)) -> () {
        appColorDao?.save(rgb: rgb)
    }
    
    func loadCurrentColor() -> (CGFloat,CGFloat,CGFloat) {
        let CurrentRgb = appColorDao?.load()
        return CurrentRgb!
    }
    
    var appColorDao: AppColorDao?
    
    init(dao: AppColorDao = AppColorDao()) {
        appColorDao = dao
    }
    
}
