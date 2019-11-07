//
//  CustomControl.swift
//  StarRating
//
//  Created by admin on 10/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    private var labels: [UILabel] = []
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUp()
    }
    
    func setUp() {
        
        var seperationWidth: CGFloat = 8
        
        for index in 1...componentCount {
            
            let label = UILabel()
            
            tag = index
            
            label.frame = CGRect(x: seperationWidth, y: 0, width: componentDimension, height: componentDimension)
            let newSeperator = 8 + componentDimension
            seperationWidth += newSeperator
            
            
            if index == 1 {
                
                label.textColor = componentActiveColor
                
            } else {
                
                label.textColor = componentInactiveColor
                
            }
            
            
            // layout
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            addSubview(label)
            labels.append(label)
        }
        
    }
   
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Get the location of the touch to get the color at that point
        
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            
            for label in labels {
                
                value = label.tag
                
                if label.tag <= value{
                    
                    label.textColor = componentActiveColor
                    
                } else {
                    
                    label.textColor = componentInactiveColor
                }
                
                sendActions(for: [.touchUpInside, .valueChanged])
                
            }
            
        } else {
            sendActions(for: [.touchDragOutside])
            return false
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            
            for label in labels {
                
                value = label.tag
                
                if label.tag <= value {
                    
                    label.textColor = componentActiveColor
                    
                } else {
                    
                    label.textColor = componentInactiveColor
                }
                
                sendActions(for: [.touchUpInside, .valueChanged])
                
            }
            
        } else {
            
            sendActions(for: [.touchDragOutside])
            return false
            
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer {
            
            super.endTracking(touch, with: event)
            
        }
        
        guard let touchPoint = touch?.location(in: self) else {return}
        
        if self.bounds.contains(touchPoint) {
            
            sendActions(for: [.touchUpInside, .valueChanged])
            
        } else {
            sendActions(for: [.touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

    
    
}


