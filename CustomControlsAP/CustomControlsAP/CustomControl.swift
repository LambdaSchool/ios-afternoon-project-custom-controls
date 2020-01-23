//
//  CustomControl.swift
//  CustomControlsAP
//
//  Created by Jorge Alvarez on 1/23/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import Foundation
import UIKit



class CustomControl: UIControl {
    
    // MARK: - Properties
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.systemYellow
    private let componentInactiveColor = UIColor.systemGray6
    
    var value: Int = 1 {
        didSet {
            setNeedsDisplay()
        }
    }
    var labelArray: [UILabel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for i in 1...5 {
            let label = UILabel()
            addSubview(label)
            labelArray.append(label)
            label.tag = i
            label.frame = CGRect(x: (componentDimension * CGFloat(i - 1)) + CGFloat(8 * i), y: 0, width: componentDimension, height: componentDimension)
            if i == 1 {
                label.textColor = componentActiveColor
                label.text = "★"
            } else {
                label.textColor = componentInactiveColor
                label.text = "☆"
            }
            
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 32) // Change later?
            //label.font = UIFont(name: "System-Bold", size: 32)
            //label.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Hanlders
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //let touchPoint = touch.location(in: self)
        updateValue(at: touch)
        sendActions(for: [.touchDown, .touchUpInside, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        print("updateValue called")
        let touchPoint = touch.location(in: self)
        
        for label in labelArray {
            if label.frame.contains(touchPoint) {
                self.value = label.tag
                for lab in labelArray {
                    if lab.tag <= self.value {
                        lab.textColor = componentActiveColor
                        lab.text = "★"
                    }
                    else {
                        lab.textColor = componentInactiveColor
                        lab.text = "☆"
                    }
                }
                //label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
                label.performFlare()
            }
        }
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
