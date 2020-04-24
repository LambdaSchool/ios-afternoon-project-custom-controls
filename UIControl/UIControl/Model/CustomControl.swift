//
//  CustomControl.swift
//  UIControl
//
//  Created by Bree Jeune on 4/23/20.
//  Copyright © 2020 Young. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInActiveColor: UIColor = .gray
    var labelArray: [UILabel] = []

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup(){
        for index in 1...componentCount {
            let label = UILabel()
            label.tag = index

            let offset = CGFloat(index - 1) * componentDimension + CGFloat(index) * 8.0
            
            let origin = CGPoint(x: offset, y: 0.0)
            
            let size = CGSize(width: componentDimension, height: componentDimension)

            label.frame = CGRect(origin: origin, size: size)

            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center

            label.textColor = componentInActiveColor
            
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
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
           updateValue(at: touch)
           sendActions(for: [.touchDown])
            return true
        }

        override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
             let touchPoint = touch.location(in: self)
            if bounds.contains(touchPoint){
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

            if bounds.contains(touchPoint){
                sendActions(for: [.touchUpInside])
            } else {
                sendActions(for: [.touchUpOutside])
            }
        }

        override func cancelTracking(with event: UIEvent?) {
            sendActions(for: [.touchCancel])
        }

        func updateValue(at touch: UITouch){
            
            let oldValue = value
            for label in labelArray {
                if label.frame.contains(touch.location(in: self)){
                    value = label.tag
                    for index in 1...componentCount {
                        switch index <= value {
                        case true:
                            labelArray[index - 1].textColor = componentActiveColor
                        case false:
                            labelArray[ index - 1].textColor = componentInActiveColor
                        }
                    }
                    label.performFlare()
                    if value != oldValue{
                        sendActions(for: [.valueChanged])
                    }
                }
            }
        }
    }

    extension UIView {
        func performFlare() {
            func flare()   { transform = CGAffineTransform(scaleX: 4.6, y: 4.6) }
            func unflare() { transform = .identity }

            UIView.animate(withDuration: 0.6,
                           animations: { flare() },
                           completion: { _ in UIView.animate(withDuration: 0.2) { unflare() }})
        }
}
