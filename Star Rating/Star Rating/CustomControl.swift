//
//  CustomControl.swift
//  Star Rating
//
//  Created by Nathan Hedgeman on 7/16/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Stuck here. Stars not showing up in view

class CustomControl: UIControl {
    
    var starArray: [UIView] = []
    var value = 1
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        func setUp() {
            
            
            for _ in 1...componentCount {

                let star = UILabel()
                

                addSubview(star)

                star.tag = starArray.count + 1
                
                star.frame.size = CGSize(width: componentDimension, height: componentDimension)
                
                star.text = "★"
                
                star.font = UIFont(name: "bold system font", size: 32.0)
                
                star.textAlignment = .center

                
                //Set Star Location and Color
                switch star.tag {
                case 1:
                    star.frame.origin = CGPoint(x: 8, y: 0)
                    star.textColor = componentActiveColor
                case 2:
                    star.frame.origin = CGPoint(x: componentDimension + 16, y: 0)
                    star.textColor = componentInactiveColor
                case 3:
                    star.frame.origin = CGPoint(x: componentDimension + 24, y: 0)
                    star.textColor = componentInactiveColor
                case 4:
                    star.frame.origin = CGPoint(x: componentDimension + 32, y: 0)
                    star.textColor = componentInactiveColor
                case 5:
                    star.frame.origin = CGPoint(x: componentDimension + 40, y: 0)
                    star.textColor = componentInactiveColor
                default:
                    star.frame.origin = CGPoint(x: componentDimension + 48, y: 0)
                    star.textColor = componentInactiveColor
                }
                
                starArray.append(star)
//
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

extension CustomControl {
    
    //Touch Controls
    
    func updateValue(at touch: UITouch) {
        
        
        
        for x in starArray {
            
            if (touch.location(in: self) == touch.location(in: x)) /*&& !(x.tag == value)*/ {
                
                x.tintColor = componentActiveColor
                value = x.tag
                sendActions(for: .valueChanged)
                performFlare()
                
                
            } else {
                x.tintColor = componentInactiveColor
            }
        }
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
            
        } else {
            
            sendActions(for: .touchDragOutside)
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer {
            
            super.endTracking(touch, with: event)
        }
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
        if bounds.contains(touchPoint) {
            
            sendActions(for: [.touchUpInside, .valueChanged])
            
        } else {
            
            sendActions(for: .touchUpOutside)
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
        sendActions(for: [.touchCancel])
        
    }
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
