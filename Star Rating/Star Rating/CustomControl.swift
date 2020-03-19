//
//  CustomControl.swift
//  Star Rating
//
//  Created by Mark Gerrior on 3/19/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {

    // MARK: - Properties

    var value: Int = 1 {
        didSet {
            // TODO: Does this satisfy the strech> Store the old value before changing it and only send an update when the value has changed
            if value != oldValue {
                updateStars()
            }
        }
    }
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    let componentActiveText = "★"
    let componentInactiveText = "☆"
    let componentSpace: CGFloat = 8.0
    
    var stars = [UILabel]()

    // FIXME: Did I need to implement wasTriggered ?
    
    // MARK: - Initializers

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - View Lifecycle

    func setup() {
        var spacer: CGFloat = 0.0
        
        for count in 1...componentCount {
            let newStar = UILabel()
            newStar.tag = count
            
            // Place them in the view
            spacer += componentSpace
            newStar.frame = CGRect(origin: CGPoint(x: spacer, y: 0),
                                   size: CGSize(width: componentDimension, height: componentDimension))
            spacer += componentDimension

            // Set the font
            newStar.font = .boldSystemFont(ofSize: 32.0)
            newStar.text = componentInactiveText
            newStar.textAlignment = .center
            newStar.textColor = count > 1 ? componentInactiveColor : componentActiveColor
            
            addSubview(newStar)
            stars.append(newStar)
        }
        
        updateStars()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * componentSpace
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }

    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
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
    
    private func updateStars() {
        for star in stars {
            star.textColor = star.tag <= value ? componentActiveColor : componentInactiveColor
            star.text = star.tag <= value ? componentActiveText : componentInactiveText
            if star.tag == value {
                star.performFlare()
            }
        }
    }
    
    private func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)

        for star in stars {
            if star.frame.contains(touchPoint) {
                value = star.tag
                print("Star \(value)")
            }
        }
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        // TODO: ? the end handler generates a value update. It provides a little safety net in case the lift event has moved the finger in an untracked movement. You can omit it if desired or keep it if you feel cautious.
        // TODO: ? Replace the two actions with touchUpInside and touchUpOutside instead of the drag forms you used for continue.

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
