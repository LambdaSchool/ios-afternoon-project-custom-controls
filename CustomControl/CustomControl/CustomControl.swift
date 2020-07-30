//
//  CustomControl.swift
//  CustomControl
//
//  Created by Norlan Tibanear on 7/29/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 {
        didSet {
            updateViews()
        }
    }//
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor = UIColor.yellow
    private let componentInactiveColor = UIColor.gray
    
    private var components: [UILabel] = []
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
   func setup() {
        for i in 1...componentCount {
            let labels = UILabel(frame: CGRect(x: CGFloat(i) * 8 + (CGFloat(i) - 1) * componentDimension,
                                              y: 0.0,
                                              width: componentDimension,
                                              height: componentDimension))
            labels.translatesAutoresizingMaskIntoConstraints = true
            labels.tag = i
            addSubview(labels)
            components.append(labels)
            labels.font = UIFont.systemFont(ofSize: 32)
            labels.text = "★"
            labels.textAlignment = .center
            
            if i == 1 {
                labels.textColor = componentActiveColor
            } else {
                labels.textColor = componentInactiveColor
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
        for component in components {
            if component.frame.contains(touch.location(in: self)) {
                self.value = component.tag
            }
        }
    }
    
    private func updateViews() {
        
        for labels in components {
            if labels.tag <= self.value {
                labels.textColor = componentActiveColor
            } else {
                labels.textColor = componentInactiveColor
            }
        }
    }//
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
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
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    
} // Class
