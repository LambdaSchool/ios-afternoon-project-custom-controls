//
//  CustomControl.swift
//  Star Rating
//
//  Created by Jesse Ruiz on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.systemYellow
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        var space: CGFloat = 0
        for num in 0...4 {
            if num == 0 {
                space = 8
            } else if num == 1 {
                space = 16 + componentDimension
            } else {
                space = CGFloat(num * 8 + 8) + componentDimension
            }
            let label = UILabel(frame: CGRect(x: space, y: 0, width: componentDimension, height: componentDimension))
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "✭"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            
            guard let view = self.viewWithTag(num) else { return }
            view.addSubview(label)
            labelArray.append(label)
            
            
            
            //space += CGFloat(8)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for star in labelArray.indices {
            if labelArray[star].frame.contains(touch.location(in: self)) {
                for aStar in labelArray.indices {
                    if aStar <= star {
                        labelArray[aStar].textColor = componentActiveColor
                    } else {
                        labelArray[aStar].textColor = componentInactiveColor
                    }
                }
                sendActions(for: .valueChanged)
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
        } else {
            sendActions(for: [.touchDragInside, .touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpInside, .touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
