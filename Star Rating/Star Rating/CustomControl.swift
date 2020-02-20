//
//  CustomControl.swift
//  Star Rating
//
//  Created by Ufuk Türközü on 23.01.20.
//  Copyright © 2020 Ufuk Türközü. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    var labels: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        backgroundColor = .clear
        
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 32, weight: .bold)
            label.text = "✮"
            
            switch i {
            case 1:  label.textColor = componentActiveColor
            default: label.textColor = componentInactiveColor
            }
            
            let offset = CGFloat(i - 1) * componentDimension + CGFloat(i) * 8
            let origin = CGPoint(x: offset, y: 0)
            let size = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: origin, size: size)
            
            labels.append(label)
            addSubview(label)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        let oldValue = value
        let touchPoint = touch.location(in: self)
        
        for label in labels {
            if label.frame.contains(touchPoint) && label.tag != value {
                value = label.tag
                
                for i in 1 ... componentCount {
                    switch i <= value {
                    case true:
                        labels[i - 1].textColor = componentActiveColor
                    case false:
                        labels[i - 1].textColor = componentInactiveColor
                    }
                }
            }
        }
        
        if value != oldValue {
            sendActions(for: .valueChanged)
        }
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else {
            return
        }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}


