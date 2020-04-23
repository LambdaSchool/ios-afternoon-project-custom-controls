//
//  CustomControl.swift
//  RateMe
//
//  Created by Lambda_School_Loaner_241 on 4/16/20.
//  Copyright © 2020 Lambda_School_Loaner_241. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    var tagValue: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    // step 6 - 7 (custom control)
    required init?(coder acoder: NSCoder) {
        super.init(coder: acoder)
        setup()
    }
    
    func setup(){
        var label1 = UILabel()
        var label2 = UILabel()
        var label3 = UILabel()
        var label4 = UILabel()
        var label5 = UILabel()
        
        
        let labelArray = [label1, label2, label3, label4, label5]
        
        for labels in labelArray {
            self.addSubview(labels)
            labels.tag = tagValue
            tagValue = tagValue + 1
            
            switch labels {
            case label1:
                labels.frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
                
            case label2:
                labels.frame = CGRect(x: componentDimension + 16.0, y: 0, width: componentDimension, height: componentDimension)
                
            case label3:
                labels.frame = CGRect(x: componentDimension + 24.0, y: 0, width: componentDimension, height: componentDimension)
                
            case label4:
                labels.frame = CGRect(x: componentDimension + 32.0, y: 0, width: componentDimension, height: componentDimension)
                
            case label5:
                labels.frame = CGRect(x: componentDimension + 40.0, y: 0, width: componentDimension, height: componentDimension)

            default:
                print("label")
            }
            

            
            
            labels.font = .boldSystemFont(ofSize: 32.0)
            labels.text = "☆"
            labels.textAlignment = .center
            
            if labels == label1 {
                labels.textColor = componentActiveColor
            } else {
                labels.textColor = componentInactiveColor
            }
            
           
        }
        
        
        
        
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    
    
    
    
}



