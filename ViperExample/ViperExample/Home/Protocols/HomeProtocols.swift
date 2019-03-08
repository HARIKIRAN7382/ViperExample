//
//  HomeProtocols.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

protocol HomeView: class {
    func LoadCurrentColor(rgb:(CGFloat,CGFloat,CGFloat)) -> (Void)
}
protocol HomeUseCase: class  {
    func loadCurrentColor() -> (CGFloat,CGFloat,CGFloat)
    func saveCurrentColor(rgb:(CGFloat,CGFloat,CGFloat)) -> ()
}

protocol HomeViewPresentation: class  {
    var view: HomeView?{get}
    var router: HomeViewWirefarame?{get}
    var interactor: HomeUseCase?{get}
    
    func  OnLoadCurrentColor()->()
    func onColorValueChange(rgb: (CGFloat,CGFloat,CGFloat))->()
    
}

protocol HomeViewWirefarame: class {
    var viewController: UIViewController? {get}
    
}
