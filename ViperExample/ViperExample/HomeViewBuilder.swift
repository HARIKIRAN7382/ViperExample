//
//  HomeViewBuilder.swift
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
protocol HomeViewPresentation: class  {
    var view: HomeView?{get}
    var router: HomeViewWirefarame?{get}
    var interactor: HomeUseCase?{get}
    
    func  OnLoadCurrentColor()->()
    func onColorValueChange(rgb: (CGFloat,CGFloat,CGFloat))->()
    
}
class HomeViewPresenter: HomeViewPresentation{
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
    
    
    var interactor: HomeUseCase?
    var router: HomeViewWirefarame?
    weak var view: HomeView?
    
}
protocol HomeViewWirefarame: class {
    var viewController: UIViewController? {get}
    
}
class HomeRouter: HomeViewWirefarame{
    var viewController: UIViewController?
    
    
}
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
