//
//  RatingControl.swift
//  RatingCustomControl
//
//  Created by Alex Rhodes on 9/12/19.
//  Copyright © 2019 Alex Rhodes. All rights reserved.
//

import UIKit

class RatingControl: UIControl {
    
    var value: Int = 1
    
    private var dimension: CGFloat = 40
    private var count = 5
    private var activeColor: UIColor = .black
    private var inactiveColor: UIColor = .gray
    private var labels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(count) * dimension
        let componentsSpacing = CGFloat(count + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: dimension)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setSubViews()
    }
    
    
    private func setSubViews() {
        
        var seperationWidth: CGFloat = 8
        
        for index in 1...count {
            
            let label = UILabel()
            
            tag = index
            
            label.frame = CGRect(x: seperationWidth, y: 0, width: dimension, height: dimension)
            let newSeperator = 8 + dimension
            seperationWidth += newSeperator
            
            
            if index == 1 {
                
                label.textColor = activeColor
                
            } else {
                
                label.textColor = inactiveColor
                
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
                    
                    label.textColor = activeColor
                    
                } else {
                    
                    label.textColor = inactiveColor
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
                    
                    label.textColor = activeColor
                    
                } else {
                    
                    label.textColor = inactiveColor
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


