//
//  CustomControl.swift
//  StarRating
//
//  Created by Bobby Keffury on 9/26/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    var stars: [UILabel] = []
   
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    
    
    private func setup() {
        
            
        let star1 = UILabel(frame: CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension))
        let star2 = UILabel(frame: CGRect(x: componentDimension + 16.0, y: 0, width: componentDimension, height: componentDimension))
        let star3 = UILabel(frame: CGRect(x: componentDimension + 64.0, y: 0, width: componentDimension, height: componentDimension))
        let star4 = UILabel(frame: CGRect(x: componentDimension + 112.0 , y: 0, width: componentDimension, height: componentDimension))
        let star5 = UILabel(frame: CGRect(x: componentDimension + 160.0, y: 0, width: componentDimension, height: componentDimension))
            
            
            
        star1.tag = 1
        star2.tag = 2
        star3.tag = 3
        star4.tag = 4
        star5.tag = 5
            
            
        star1.font = UIFont(name: "bold system font", size: 32.0)
        star2.font = UIFont(name: "bold system font", size: 32.0)
        star3.font = UIFont(name: "bold system font", size: 32.0)
        star4.font = UIFont(name: "bold system font", size: 32.0)
        star5.font = UIFont(name: "bold system font", size: 32.0)
            
        star1.text = "☆"
        star2.text = "☆"
        star3.text = "☆"
        star4.text = "☆"
        star5.text = "☆"
            
        star1.textAlignment = .center
        star2.textAlignment = .center
        star3.textAlignment = .center
        star4.textAlignment = .center
        star5.textAlignment = .center
            
        star1.textColor = componentActiveColor
        star2.textColor = componentInactiveColor
        star3.textColor = componentInactiveColor
        star4.textColor = componentInactiveColor
        star5.textColor = componentInactiveColor
            
        addSubview(star1)
        addSubview(star2)
        addSubview(star3)
        addSubview(star4)
        addSubview(star5)
            
        stars.append(star1)
        stars.append(star2)
        stars.append(star3)
        stars.append(star4)
        stars.append(star5)
    }
    
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
            updateValue(at: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touchPoint)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else  {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
         defer { super.endTracking(touch, with: event) }
               
               guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touchPoint)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else  {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    
    func updateValue(at touchPoint: CGPoint) {
        
        
    }
    
    
}
