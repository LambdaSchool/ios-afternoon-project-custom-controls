//
//  CustomControl.swift
//  CustomControls
//
//  Created by BDawg on 11/7/19.
//  Copyright © 2019 Brandi. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor = UIColor.yellow
    private let componentInactiveColor = UIColor.gray
    
    var stars: [UILabel] = []
    var starCount: Int = 0
    var componentX: CGFloat = 8

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    
    func setupSubviews() {
        
        for component in 1...componentCount {
        
            starCount += 1
            
            print("First: \(componentX)")
            let label = UILabel(frame: CGRect(x: componentX, y: 0.0, width: componentDimension, height: componentDimension))
            componentX += (componentDimension + 8)
            print(componentX)
            print("Label minX: \(label.frame.minX)")
            
            label.tag = starCount
            
            label.text = "★"
            label.textColor = componentInactiveColor
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 32)
            addSubview(label)
            stars.append(label)
            
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown, .valueChanged])
        updateValue(at: touch)
               return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for:  [.touchDragInside, .valueChanged])
        updateValue(at: touch)
          return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
       sendActions(for: [.touchUpInside, .valueChanged])
    }
    
    override func cancelTracking(with event: UIEvent?) {
       sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for label in stars {
            if label.frame.contains(touchPoint) {
                value = label.tag
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
