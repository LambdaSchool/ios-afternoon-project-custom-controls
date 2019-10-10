//
//  CustomControl.swift
//  iOS-CustomControls
//
//  Created by Jonalynn Masters on 10/10/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class CustomControl: UIControl { // new type subclassed from UIControl
    
    // MARK: Properties
    // establish your control as a value-providing and value-changing type
    var value: Int = 1 // value variable type int set initially to 1
    var labelArray: [UILabel] = []
    
    let componentDimension: CGFloat = 40.0
    var componentCount = 5
    let componentActiveColor: UIColor = .systemGreen
    let componentInactiveColor: UIColor = .gray
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    // MARK: Functions
    // MARK: Required init
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
   // MARK: Setup Func
    func setup() {
        
        for labelIndex in 1...componentCount {
            let offset: CGFloat = CGFloat(labelIndex - 1) * componentDimension + CGFloat(labelIndex) * 8
            
            let starLabel = UILabel(frame: CGRect(x: offset,
                                                  y: 0,
                                                  width: componentDimension,
                                                  height: componentDimension))
            starLabel.text = "✰"
            starLabel.font = .boldSystemFont(ofSize: 32)
            starLabel.textAlignment = .center
            starLabel.tag = labelIndex
            if starLabel.tag == 1 {
                starLabel.textColor = componentActiveColor
            } else {
                starLabel.textColor = componentInactiveColor
            }
            self.addSubview(starLabel)
            labelArray.append(starLabel)
        }
    }
   // MARK: Update Values Func
    func updateValue(at touch: UITouch) {
        
        for label in labelArray {
            let touchPoint = touch.location(in: self)
            if label.frame.contains(touchPoint) {
                label.performFlare()
                value = label.tag
                for label in labelArray {
                    if label.tag <= value {
                        label.textColor = componentActiveColor
                    } else {
                        label.textColor = componentInactiveColor
                    }
                }
            }
        }
    }
}
// MARK: Touch Functions
extension CustomControl {
    
    // MARK: beginTracking
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    // MARK: continueTracking
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    //MARK: endTracking
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    // MARK: cancelTracking
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
// MARK: Flare Animation
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

    

