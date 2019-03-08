//
//  ViewController.swift
//  ViperExample
//
//  Created by iOS Developer on 28/02/2019 Saka.
//  Copyright © 1940 iOS Developer. All rights reserved.
//

import UIKit

protocol ColorValueDelegate {
    func onColorValueChange() -> ()
}
class HomeViewController: UIViewController {

    @IBOutlet weak var SliderRed: UISlider!
    @IBOutlet weak var SliderGreen: UISlider!
    @IBOutlet weak var SliderBlue: UISlider!
    @IBOutlet weak var RGBLabel: UILabel!
    
    var presenter: HomeViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LoadSavedValues()
        
//        SliderRed.value = Float(rgb.0)
//        SliderBlue.value = Float(rgb.1)
//        SliderGreen.value = Float(rgb.2)
//
//        RGBLabel.text = "RGB(\(rgb.0),\(rgb.1),\(rgb.2))"
//        
//        self.view.backgroundColor = UIColor(red: rgb.0/250, green: rgb.1/250, blue: rgb.2/250, alpha: 1.0)
        
       
    }

    @IBAction func OnRedValueChanged(_ sender: UISlider) {
         onColorValueChange()
    }
    @IBAction func OnGreenValueChanged(_ sender: UISlider) {
         onColorValueChange()
    }
    
    @IBAction func OnBlueValueChange(_ sender: UISlider) {
         onColorValueChange()
    }
    
    func SaveCurrentValues(rgb:(CGFloat,CGFloat,CGFloat))->(Void){
       print("Current Color are Saved")
        presenter?.onColorValueChange(rgb: rgb)
    }
    
    func LoadSavedValues() -> () {
       print("View Controller Delegating loadCurrent COlor to Presenter!")
        presenter?.OnLoadCurrentColor()
    }
    
}
extension HomeViewController: ColorValueDelegate{
    func onColorValueChange() {
        let set: Float = 1.0
        let red = CGFloat(round(SliderRed.value / set) *  set)
        let green = CGFloat( round(SliderGreen.value / set) *  set)
        let blue = CGFloat(round(SliderBlue.value / set) *  set)
        
        RGBLabel.text = "RGB(\(red),\(green),\(blue))"
        
        self.view.backgroundColor = UIColor(red: red/250, green: green/250, blue: blue/250, alpha: 1.0)
        SaveCurrentValues(rgb: (red, green, blue))
    }
    
}
extension HomeViewController: HomeView{
    func LoadCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) {
                SliderRed.value = Float(rgb.0)
                SliderBlue.value = Float(rgb.1)
                SliderGreen.value = Float(rgb.2)
        
                RGBLabel.text = "RGB(\(rgb.0),\(rgb.1),\(rgb.2))"
        
                self.view.backgroundColor = UIColor(red: rgb.0/250, green: rgb.1/250, blue: rgb.2/250, alpha: 1.0)
    }
    
    
}

