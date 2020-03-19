//
//  CustomControl.swift
//  StarProject
//
//  Created by Bradley Diroff on 3/19/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    var value = 1
    var starArray: [UILabel] = []
    
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        for i in 1...5 {
            print(i)
            let label = UILabel()
            label.tag = i
            let xPosition = (componentDimension * CGFloat(i - 1)) + CGFloat(8 * i)
            label.frame = CGRect(x: xPosition, y: 0.0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            label.text = "☆"
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            starArray.append(label)
            addSubview(label)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        for star in starArray {
            let touchLocation = touch.location(in: self)
            if star.frame.contains(touchLocation) {
                print("felt location \(star.tag)")
                if value != star.tag {
                    value = star.tag
                    star.performFlare()
                    
                    switch value {
                    case 1:
                        starArray[0].textColor = componentActiveColor
                        starArray[1].textColor = componentInactiveColor
                        starArray[2].textColor = componentInactiveColor
                        starArray[3].textColor = componentInactiveColor
                        starArray[4].textColor = componentInactiveColor
                    case 2:
                        starArray[0].textColor = componentActiveColor
                        starArray[1].textColor = componentActiveColor
                        starArray[2].textColor = componentInactiveColor
                        starArray[3].textColor = componentInactiveColor
                        starArray[4].textColor = componentInactiveColor
                    case 3:
                        starArray[0].textColor = componentActiveColor
                        starArray[1].textColor = componentActiveColor
                        starArray[2].textColor = componentActiveColor
                        starArray[3].textColor = componentInactiveColor
                        starArray[4].textColor = componentInactiveColor
                    case 4:
                        starArray[0].textColor = componentActiveColor
                        starArray[1].textColor = componentActiveColor
                        starArray[2].textColor = componentActiveColor
                        starArray[3].textColor = componentActiveColor
                        starArray[4].textColor = componentInactiveColor
                    case 5:
                        starArray[0].textColor = componentActiveColor
                        starArray[1].textColor = componentActiveColor
                        starArray[2].textColor = componentActiveColor
                        starArray[3].textColor = componentActiveColor
                        starArray[4].textColor = componentActiveColor
                    default:
                        break
                    }
                }
            }
        }
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
