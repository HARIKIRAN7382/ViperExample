//
//  HomeViewPresenter.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

class HomeViewPresenter: HomeViewPresentation{
    var interactor: HomeUseCase?
    var router: HomeViewWirefarame?
    weak var view: HomeView?
    
    func onColorValueChange(rgb: (CGFloat,CGFloat,CGFloat)) {
        DispatchQueue.global(qos: .background).async {
            [weak self] in
            guard let `self` = self else {return}
            self.interactor?.saveCurrentColor(rgb: rgb)
        }
        
    }
    
    
    func OnLoadCurrentColor() {
        
        DispatchQueue.global(qos: .background).async {[weak self] in
            
            guard  let `self` = self else { return }
            
            let currentRgb = self.interactor?.loadCurrentColor()
            
            DispatchQueue.main.async {
                self.view?.LoadCurrentColor(rgb: currentRgb!)
            }
        }
        
        
        
    }
    
    
    
    
}
