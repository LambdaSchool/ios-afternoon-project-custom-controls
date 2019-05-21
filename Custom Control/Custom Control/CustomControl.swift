//
//  CustomControl.swift
//  Custom Control
//
//  Created by Hayden Hastings on 5/21/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Methods
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for i in 0...4 {
            let label = UILabel()
            
            let frame = CGRect(x: 8 + componentDimension * CGFloat(i), y: 0, width: componentDimension, height: componentDimension)
            
            label.frame = frame
            label.tag = i + 1
            label.font = UIFont.boldSystemFont(ofSize: 32)
            
            label.text = "✯"
            
            stars.append(label)
            
        }
        
        stars.forEach( { addSubview( $0 )} )
        
        for star in stars {
            star.textColor = componentInactiveColor
        }
    }
    
    
    func isRated(value: Int) {
        for i in 0..<value {
            stars[i].textColor = componentActiveColor
        }
        unRated(value: value)
    }
    
    func unRated(value: Int) {
        for star in stars {
            if star.tag > value {
                star.textColor = componentInactiveColor
            }
        }
    }
    
    func updateValue(at touch: UITouch) {
        for star in stars {
            if star.frame.contains(touch.location(in: self)) {
                value = star.tag
                isRated(value: value)
                
                sendActions(for: [.valueChanged])
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
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
            
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer { super.endTracking(touch, with: event) }
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Properties
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    var stars: [UILabel] = []
    var value: Int = 1
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
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
