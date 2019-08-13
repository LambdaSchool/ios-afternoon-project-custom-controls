//
//  CustomControl.swift
//  Star Rating
//
//  Created by Nathan Hedgeman on 8/13/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation
import UIKit

class CustomControl : UIControl {
    
    //Properties
    var value: Int = 1
    var starArray: [UILabel] = []
    var stackView = UIStackView()
    
    let componentDimension: CGFloat = 40
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
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
}

//MARK: - Funtions
extension CustomControl {
    
    func setup() {
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 25
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor )
        stackView.backgroundColor = .red
        stackView.isUserInteractionEnabled = false
        self.addSubview(stackView)
        
        for _ in 1...componentCount {
            
            let star = UILabel()
            
            star.tag = starArray.count + 1
            
            star.frame.size = CGSize(width: componentDimension, height: componentDimension)
            
            star.text = "★"
            
            star.font = .boldSystemFont(ofSize: 35)
            
            star.textAlignment = .center
            
            stackView.addArrangedSubview(star)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            //Set Star Color
            switch star.tag {
            case 1:
                star.textColor = componentActiveColor
            case 2:
                star.textColor = componentInactiveColor
            case 3:
                star.textColor = componentInactiveColor
            case 4:
                star.textColor = componentInactiveColor
            case 5:
                star.textColor = componentInactiveColor
            default:
                star.textColor = componentInactiveColor
            }
            
            starArray.append(star)
        }
    }
}

//MARK: Touch Controls
extension CustomControl {
    
    func updateValue(at touch: UITouch) {
        
        let touchPoint = touch.location(in: self)
        
        for starLabel in starArray {
            
            if starLabel.frame.contains(touchPoint) {
                
                value = starLabel.tag
                //starLabel.performFlare()
                sendActions(for: .valueChanged)
                
                
                for starLabel in starArray {
                    
                    if starLabel.tag <= value {
                        starLabel.textColor = componentActiveColor
                        starLabel.performFlare()
                    } else {
                        starLabel.textColor = componentInactiveColor
                    }
                }
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
    
    func performFlare() {
        func flare() {
            transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }
        func unflare() {
            transform = .identity
        }
        
        func rotate() {
            transform = CGAffineTransform(rotationAngle: 0.5)
        }
        
        UIView.animate(withDuration: 0.3, animations: {flare()}, completion: { _ in UIView.animate(withDuration: 0.1) {unflare()}})
    }
    
}


