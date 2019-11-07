//
//  CustomControl.swift
//  Star Rating
//
//  Created by Jon Bash on 2019-11-07.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    var components = [UILabel]()
    
    let componentCount: Int = 5
    let componentDimension: CGFloat = 40
    let componentSpaceInterval: CGFloat = 8
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    //let unselectedComponentText = "☆"
    let componentText = "★"
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        var starLabels = [UILabel]()
        for i in 1...componentCount {
            let starLabel = UILabel()
            
            //starLabel.translatesAutoresizingMaskIntoConstraints = false
            starLabel.frame = CGRect(
                x: CGFloat(i) * (componentSpaceInterval + componentDimension) - componentDimension,
                y: 0,
                width: componentDimension,
                height: componentDimension
            )
            starLabel.tag = i
            starLabel.font = .boldSystemFont(ofSize: 32)
            starLabel.text = componentText
            starLabel.textColor = i == 1 ? componentActiveColor : componentInactiveColor
            
            addSubview(starLabel)
            starLabels.append(starLabel)
        }
        components = starLabels
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * componentSpaceInterval
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
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
