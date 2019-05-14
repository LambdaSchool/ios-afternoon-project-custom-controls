//
//  CustomControl.swift
//  CustomControls-Rating
//
//  Created by Lisa Sampson on 5/14/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // MARK : - Properties
    var value: Int = 1
    var labels = [UILabel]()
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    // MARK: - View Loading
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    func setup() {
        for index in 1...componentCount {
            let x = CGFloat(index - 1)*(componentDimension + 8.0)
            let newLabel = UILabel(frame: CGRect(x: x, y: 0.0, width: componentDimension, height: componentDimension))
            newLabel.tag = index
            newLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            newLabel.text = "✰"
            newLabel.textAlignment = .center
            newLabel.textColor = index == 1 ? componentActiveColor : componentInactiveColor
            
            addSubview(newLabel)
            labels.append(newLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Handling
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
    
    func updateValue(at touch: UITouch) {
        
    }
}
