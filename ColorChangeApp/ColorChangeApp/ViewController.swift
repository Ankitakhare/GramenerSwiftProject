//
//  ViewController.swift
//  ColorChangeApp
//
//  Created by pheonix on 09/11/21.
//  Copyright © 2021 pheonix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backGroundColorLabel: UILabel!
    @IBOutlet weak var nextColorButton: UIButton!
    
    let colors:[UIColor] = [UIColor.red, UIColor.blue, UIColor.orange, UIColor.yellow]
    var currentIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpInitialState()
    }

//Mark:-  Private Methods
    
    private func setUpInitialState() {
        if let defaultColor  = self.colors.first{
        self.view.backgroundColor = defaultColor
    }
        self.backGroundColorLabel.text = self.getColorName(color: self.view.backgroundColor)//"Red"
        self.backGroundColorLabel.backgroundColor = UIColor.white
        self.backGroundColorLabel.textAlignment = .center
        
        //set button
        let count = self.colors.count
        if count > 0{
            //self.nextColorButton.setTitle("Blue", for: .normal)
            self.nextColorButton.setTitle(self.getColorName(color: self.nextColorButton.backgroundColor), for: .normal)
            self.nextColorButton.backgroundColor = self.colors[1]
            self.nextColorButton.layer.borderWidth = 1.0
            self.nextColorButton.layer.cornerRadius = 1.0
            self.nextColorButton.layer.borderColor = UIColor.white.cgColor
            
        }
        
    }
    
    private func changeBackground(index: Int){
        //set proper index value
        let selectedIndex = (index >= self.colors.count - 1) ? 0 : index + 1
        
        self.view.backgroundColor = self.colors[selectedIndex]
        self.backGroundColorLabel.text = self.getColorName(color: self.view.backgroundColor )
        self.nextColorButton.backgroundColor = self.colors[selectedIndex == self.colors.count - 1 ? 0 : selectedIndex + 1]
        self.nextColorButton.setTitle(self.getColorName(color: self.nextColorButton.backgroundColor), for: .normal)
        currentIndex = selectedIndex 
    }
    
    
    private func getColorName(color: UIColor?) -> String{
        if let selectedColor = color{
        switch selectedColor{
        case .red:
           
            return "Red"
        case .blue:
            
            return "Blue"
        case .orange:
            
            return "Orange"
        default:
            
            return "Yellow"
            
            }
        }
        return ""
    }
    
      //Mark: - Action
    @IBAction func actionOnButtonClicked(_ sender: Any) {
        
        self.changeBackground(index: self.currentIndex)
        
    }
    
  
}
