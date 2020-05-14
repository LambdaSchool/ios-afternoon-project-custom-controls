//
//  CustomControl.swift
//  Rating
//
//  Created by Dahna on 5/14/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {

    
    var value: Int = 1 {
        didSet {
            if value != value {
                updateStars()
                sendActions(for: .valueChanged)
            }
        }
    }
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var labelArray = [UILabel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        
        let spacing = 8
        var x = spacing
        
        for i in 1...componentCount {
            let label = UILabel()
            labelArray.append(label)
            label.tag = i
            
            label.frame = CGRect(x: CGFloat(x),
                                 y: 0,
                                 width: componentDimension,
                                 height: componentDimension)
            
            x += Int(componentDimension) + spacing
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "★"
            label.textAlignment = .center
            if i <= value {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            addSubview(label)
            
        }
    }
    
    // MARK: Touch Handlers
    
    func updateStars() {
        
        for i in 0...labelArray.count {
            if labelArray[i].tag > value + 1 {
                labelArray[i].textColor = componentActiveColor
                print("active")
            } else {
                labelArray[i].textColor = componentInactiveColor
                print("inactive")
            }
        }
        sendActions(for: .valueChanged)
        
    }
    

    func updateValue(at touch: UITouch) {
        for i in 0..<labelArray.count {
            let touchPoint = touch.location(in: labelArray[i])
            if labelArray[i].bounds.contains(touchPoint) {
                value = i + 1
                if labelArray[i].tag <= value {
                    print(i)
                    print(value)
                    labelArray[i].textColor = componentActiveColor
                } else {
                    labelArray[i].textColor = componentInactiveColor
                }
                sendActions(for: .valueChanged)
                
                break
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)

            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])

        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
