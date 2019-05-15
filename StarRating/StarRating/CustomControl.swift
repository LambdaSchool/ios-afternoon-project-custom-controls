//
//  CustomControl.swift
//  StarRating
//
//  Created by Sameera Roussi on 5/14/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit


class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    // MARK: Properties
    
    var value: Int = 0
    var stars: [UILabel] = []
//    var starOff = "😐"
//    var starOn = "🤩"
//    var starOff = "🌑"
//    var starOn = "🌕"
    var starOff = "🖤"
    var starOn = "❤️"
    
    // MARK: Private Constants
    
    let componentDimension: CGFloat = 40.0
    
    let componentCount = 5
    
    let componentActiveColor: UIColor = .black
    
    let componentInactiveColor: UIColor = .gray
    
    
    // MARK: Functions
    
    func setup() {
        // Where the next start should be placed
        var xSpot: CGFloat = 8.0
        
        for i in 0 ..< componentCount {
            let star = UILabel.init()
            //star.frame = CGRect(x: xPosition, y: 0.0, width: componentDimension, height: componentDimension)
            star.frame = CGRect(x: xSpot, y: 0.0, width: componentDimension, height: componentDimension)
            star.text = starOff
            star.font = UIFont.boldSystemFont(ofSize: 32)
            star.textAlignment = .center
            star.tag = i
            addSubview(star)
            stars.append(star)
            xSpot += 8.0 + componentDimension
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        for starTouched in stars {
            let touchPoint = touch.location(in: starTouched)
            if bounds.contains(touchPoint) {
                value = starTouched.tag
                starTouched.text = starOn
               sendActions(for: [.touchDragInside, .valueChanged])
            } else {
                starTouched.text = starOff
                sendActions(for: [.touchDragOutside])
            }
        }
        
        return true
    }  // func
    
   
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            for starTouched in stars {
                let touchPoint = touch.location(in: starTouched)

                if bounds.contains(touchPoint) {
                    value = starTouched.tag
                    starTouched.text = starOn
                    sendActions(for: [.touchDragInside, .valueChanged])
                } else {
                    starTouched.text = starOff
                    if starTouched.tag == 0 {
                        value = -1
                    }
                   // print("The CustomControl rating sent is: \(starTouched.tag)")

                    sendActions(for: [.touchDragOutside])
                }
            }
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }

} // Class
