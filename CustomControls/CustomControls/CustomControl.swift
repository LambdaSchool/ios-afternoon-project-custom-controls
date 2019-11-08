//
//  CustomControl.swift
//  CustomControls
//
//  Created by morse on 11/7/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

//@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .yellow
    private let componentInactiveColor: UIColor = .gray
    private var components: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUpSubviews()
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // MARK: - Views
    
    func setUpSubviews() {
        
        for i in 1...componentCount {
            let label = UILabel(frame: CGRect(
                x: CGFloat(i) * 8 + (CGFloat(i) - 1) * componentDimension,
                y: 0.0,
                width: componentDimension,
                height: componentDimension))
            label.translatesAutoresizingMaskIntoConstraints = true
            addSubview(label)
            label.tag = i
            components.append(label)
            
            label.font = UIFont.systemFont(ofSize: 32)
            label.textAlignment = .center
            label.text = "★"
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Tracking
    
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
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Change Star Color
    
    func updateValue(at touch: UITouch) {
        for component in components {
            if component.frame
                .contains(touch.location(in: self)) {
                value = component.tag
                for label in components {
                    if label.tag <= value {
                        label.textColor = componentActiveColor
                    }
                }
            } else {
                for label in components {
                    if label.tag > value {
                        label.textColor = componentInactiveColor
                    }
                }
            }
        }
    }
}
