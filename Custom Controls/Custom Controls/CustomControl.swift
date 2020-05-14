//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Kelson Hartle on 5/13/20.
//  Copyright © 2020 Kelson Hartle. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    var starArray: [UILabel] = []
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func udpateValue(at touch: UITouch) {
        
        
    }

    func setup() {
        
        //create 5 labels using for loop and store in array ///figure out how to add a number to it to identify
        
        //creating custom control, using constraints, using a little bit of animation, uitextfielddelegate
        
        for _ in 1...5 {
            
            let label = UILabel()
            addSubview(label)
            
            for i in 0..<starArray.count {
                           starArray[i].tag = i
                print(starArray[i])
                       }
            
             
            label.frame.size = CGSize(width: componentCount, height: componentCount)
            label.frame = label.frame.offsetBy(dx: 8.0, dy: 0)

            
            label.font = UIFont(name: "System", size: 32.0)
            label.text = "★"
            
            if label.tag == 0 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            starArray.append(label)
        }
    }
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPPoint = touch.location(in: self) //is an x,y CGPOINT
        
        ///updateValue()
        
        sendActions(for: [.touchDown, .valueChanged])
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            //updateValue()
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        print("ok")
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
