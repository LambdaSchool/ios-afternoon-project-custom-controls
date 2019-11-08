//
//  CustomControl.swift
//  StarRater
//
//  Created by Thomas Sabino-Benowitz on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private var stars: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .yellow
    private let componentInactiveColor: UIColor = .lightGray


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    

    
    func setup() {
        for n in stride(from: 1, through: componentCount, by: 1) {
            
        
            let label = UILabel(frame: CGRect(x: 8.0 * CGFloat(n) + CGFloat(n) * componentDimension - componentDimension, y: 0, width: componentDimension, height: componentDimension))
            print(label.frame.minX)
            label.tag = Int(n)
            label.text = "✡︎"
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 32)
            
            stars.append(label)
            addSubview(label)
            
            if label.tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
        // MARK: + Touch Tracking
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [ .valueChanged, .touchDown])
        return true
    }
        
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.valueChanged, .touchDragInside])
        return true
    }
    
    override func cancelTracking(with event: UIEvent?) {
       
        sendActions(for: .touchCancel)
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else {return}
        sendActions(for: [.touchUpInside, .touchUpOutside])
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in stars {
            if label.frame.contains(touchPoint) {
            value = label.tag
            print(value)
                
            }
            switch value {
            case 1:
                stars[0].textColor = componentActiveColor
                stars[1].textColor = componentInactiveColor
                stars[2].textColor = componentInactiveColor
                stars[3].textColor = componentInactiveColor
                stars[4].textColor = componentInactiveColor
            case 2:
                stars[0].textColor = componentActiveColor
                stars[1].textColor = componentActiveColor
                stars[2].textColor = componentInactiveColor
                stars[3].textColor = componentInactiveColor
                stars[4].textColor = componentInactiveColor

            case 3:
                stars[0].textColor = componentActiveColor
                stars[1].textColor = componentActiveColor
                stars[2].textColor = componentActiveColor
                stars[3].textColor = componentInactiveColor
                stars[4].textColor = componentInactiveColor
                
            case 4:
                stars[0].textColor = componentActiveColor
                stars[1].textColor = componentActiveColor
                stars[2].textColor = componentActiveColor
                stars[3].textColor = componentActiveColor
                stars[4].textColor = componentInactiveColor
                
            case 5:
                stars[0].textColor = componentActiveColor
                stars[1].textColor = componentActiveColor
                stars[2].textColor = componentActiveColor
                stars[3].textColor = componentActiveColor
                stars[4].textColor = componentActiveColor
                
            default:
                return
            }
        }
        
        
    }
    
    override var intrinsicContentSize: CGSize {
    let componentsWidth = CGFloat(componentCount) * componentDimension
    let componentsSpacing = CGFloat(componentCount + 1) * 8.0
    let width = componentsWidth + componentsSpacing
    return CGSize(width: width, height: componentDimension)
    }


}


