//
//  CustomControl.swift
//  StarRating
//
//  Created by Bradley Yin on 8/13/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var oldValue = 1
    var value = 1
    var labels: [UILabel] = []
    
    private let componentDimension : CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        var xPostion: CGFloat = 8.0
        for i in 1...5 {
            let newLabel = UILabel(frame: CGRect(x: xPostion, y: 0.0, width: componentDimension, height: componentDimension))
            xPostion += (componentDimension + 8.0)
            newLabel.tag = i
            newLabel.font = newLabel.font.withSize(32.0)
            newLabel.text = "☆"
            newLabel.textAlignment = .center
            if i == 1 {
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.textColor = componentInactiveColor
            }
            self.addSubview(newLabel)
            labels.append(newLabel)
        }
    }
}

//MARK: - Touch Handler
extension CustomControl {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        
        sendActions(for: [.touchDown, .valueChanged])
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if self.bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
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
        
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        print(touch.location(in: self))
        
        for label in labels {
            
            if label.frame.contains(touch.location(in: self)) && value != label.tag {
                oldValue = value
                value = label.tag
                if value > oldValue {
                    for i in 1...label.tag {
                        if let updateLabel = self.viewWithTag(i) as? UILabel {
                            updateLabel.textColor = componentActiveColor
                            updateLabel.performFlare()
                        }
                    }
                }
                if value < oldValue {
                    for i in stride(from: labels.count, to: label.tag, by: -1) {
                        if let updateLabel = self.viewWithTag(i) as? UILabel {
                            updateLabel.textColor = componentInactiveColor
                        }
                    }
                    for j in 1...label.tag {
                        if let updateLabel = self.viewWithTag(j) as? UILabel {
                            updateLabel.performFlare()
                        }
                    }
                }
                
            }
        }
    }
}
extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        func changeToRed() { backgroundColor = .red }
        func changeToClear() { backgroundColor = .clear }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare()
                        changeToRed() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare()
                        changeToClear() }})
    }
}
