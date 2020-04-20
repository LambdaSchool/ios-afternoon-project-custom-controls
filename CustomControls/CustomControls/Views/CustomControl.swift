//
//  CustomControl.swift
//  CustomControls
//
//  Created by Matthew Martindale on 4/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    private let componentInactiveColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var labelArray: [UILabel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        
        backgroundColor = .clear
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.isUserInteractionEnabled = false
        
        
        for index in 1...5 {
            let label = UILabel()
            label.isUserInteractionEnabled = true
            label.tag = index
            label.text = "★"
            label.textColor = componentInactiveColor
            
            labelArray.append(label)
            
            label.frame.size.width = componentDimension
            label.frame.size.height = componentDimension
            label.font = UIFont.boldSystemFont(ofSize: 32)
            
            addSubview(label)
            stackView.addArrangedSubview(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        
        let oldValue = value
        
        let touchPoint = touch.location(in: self)
        for label in labelArray {
//            label.textColor = componentInactiveColor
            if label.frame.contains(touchPoint)
                //stops the flickering when barely moving finger while still on same star label
                && label.tag != value
            {
                value = label.tag
                
                for index in 1...componentCount {
                    switch index <= value {
                    case true:
                        labelArray[index - 1].textColor = componentActiveColor
                    default:
                        labelArray[index - 1].textColor = componentInactiveColor
                    }
                }
                label.performFlare()
                
//                label.performFlare()
//                for label in labelArray where label.tag <= value {
//                label.textColor = componentActiveColor
//                sendActions(for: .valueChanged)
//                }
            }
        }
        if value != oldValue {
            sendActions(for: .valueChanged)
        }
    }
    
}

extension CustomControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
            sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
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
            sendActions(for: [.touchUpInside, .touchUpOutside])
        } else {
            sendActions(for: .touchDragOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
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
