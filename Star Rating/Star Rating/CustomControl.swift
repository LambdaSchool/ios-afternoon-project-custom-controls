//
//  CustomControl.swift
//  Star Rating
//
//  Created by Eoin Lavery on 07/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    //MARK: - Public Properties
    var value: Int = 1
    
    //MARK: - Private Properties
    private let componentDimension: CGFloat = 40
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    private var labelArray: [UILabel] = []
    
    //MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    //MARK: - View Lifecycle
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    //MARK: - Private Functions
    private func setup() {
        self.backgroundColor = .clear
        
        for count in 1...componentCount {
            let label = UILabel()
            addSubview(label)
            label.tag = (count)
            labelArray.append(label)
            
            let labelSpacing = CGFloat(count - 1) * componentDimension + CGFloat(count) * 8.0
            let labelLocation = CGPoint(x: labelSpacing, y: 0)
            let labelSize = CGSize(width: componentDimension, height: componentDimension)
            
            label.frame = CGRect(origin: labelLocation, size: labelSize)
            
            label.text = "⭑"
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            if count == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
        }
    }
    
    private func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for label in labelArray {
            if label.frame.contains(touchPoint) {
                value = label.tag
                
            for labelCount in 1...componentCount {
                if labelCount <= value {
                    labelArray[labelCount - 1].textColor = componentActiveColor
                } else {
                    labelArray[labelCount - 1].textColor = componentInactiveColor
                }
            }
                
                label.performFlare()
            }
        }
        
        sendActions(for: .valueChanged)
    }
    
    //MARK: - Touch Tracking Events
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
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
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }

}

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
