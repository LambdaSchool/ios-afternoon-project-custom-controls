//
//  CustomControl.swift
//  CustomControls
//
//  Created by Kat Milton on 7/16/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var starsArray: [UILabel] = []
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 6
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    override func layoutSubviews() {
        clipsToBounds = true
        layer.cornerRadius = 12
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 6
        layer.shadowOffset = .zero
        layer.shadowColor = UIColor.darkGray.cgColor
    }
    
    func setup() {
        let spacing: CGFloat = 8.0
        var x: CGFloat = spacing
        
        for i in 0..<componentCount {
            
            
            let starLabel = UILabel()
            
            addSubview(starLabel)
            starLabel.tag = i + 1
            starLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            starLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            starLabel.text = "✯"
            starLabel.textAlignment = .center
            
            starLabel.frame.origin = CGPoint(x: x , y: 0.0)
            
            x += componentDimension + spacing
            
            starsArray.append(starLabel)
            
            if starLabel.tag == 1 {
                starLabel.textColor = componentActiveColor
                starLabel.layer.shadowOffset = .zero
                starLabel.layer.shadowOpacity = 1.0
                starLabel.layer.shadowRadius = 2.0
                starLabel.layer.shadowColor = UIColor.darkGray.cgColor
            } else {
                starLabel.textColor = componentInactiveColor
                starLabel.layer.shadowOffset = .zero
                starLabel.layer.shadowOpacity = 0
                starLabel.layer.shadowRadius = 0
                starLabel.layer.shadowColor = UIColor.clear.cgColor
            }
            
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for starLabel in self.starsArray {
            if starLabel.frame.contains(touchPoint) {
                if self.value != starLabel.tag {
                    starLabel.performFlare()
                    self.value = starLabel.tag
                    
                    for starLabel in self.starsArray {
                        if starLabel.tag <= value {
                            starLabel.textColor = componentActiveColor
                            starLabel.layer.shadowOffset = .zero
                            starLabel.layer.shadowOpacity = 1.0
                            starLabel.layer.shadowRadius = 2.0
                            starLabel.layer.shadowColor = UIColor.darkGray.cgColor
                        } else {
                            starLabel.textColor = componentInactiveColor
                            starLabel.textColor = componentInactiveColor
                            starLabel.layer.shadowOffset = .zero
                            starLabel.layer.shadowOpacity = 0
                            starLabel.layer.shadowRadius = 0
                            starLabel.layer.shadowColor = UIColor.clear.cgColor
                        }
                    }
                    
                    sendActions(for: .valueChanged)
                }
            }
        }
    }
    
   
}


extension CustomControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
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
