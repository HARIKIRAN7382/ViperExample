//
//  HomeViewBuilder.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import Foundation
import UIKit

class HomeViewBuilder{
    static func assembleModule() -> UIViewController?{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        let presenter = HomeViewPresenter()
        let  interactor = HomeInteractor()
        let router = HomeRouter()
        
        view?.presenter  = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.viewController = view
        
        return view
    }
    
}
