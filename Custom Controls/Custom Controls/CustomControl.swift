//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Eoin Lavery on 26/09/2019.
//  Copyright © 2019 Eoin Lavery. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    //MARK: - Properties
    //Rating property
    var value: Int = 1
    
    //Component Properties
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    //Store UILabel items
    private var labelArray: [UILabel] = []
    
    //MARK: - Initializer
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    //MARK: - Private Functions
    private func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            if i == 1 {
                label.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
            } else {
                let currentLabelPosition = CGFloat( (componentDimension * CGFloat(i - 1) + CGFloat( i * 8 )) )
                label.frame = CGRect(x: currentLabelPosition, y: 0.0, width: componentDimension, height: componentDimension)
            }
            label.font = UIFont(name: "System-Bold", size: 32.0)
            label.text = "✰"
            label.textAlignment = .center
            label.tag = i
            if i == 1 {label.textColor = componentActiveColor} else { label.textColor = componentInactiveColor}
            addSubview(label)
            labelArray.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        
    }
    
    //MARK: - Tracking Functions
    
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
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
