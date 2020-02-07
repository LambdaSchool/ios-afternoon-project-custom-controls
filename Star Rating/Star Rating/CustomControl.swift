//
//  CustomControl.swift
//  Star Rating
//
//  Created by David Wright on 2/5/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

enum LanguageDirection: Int {
    case leftToRight
    case rightToLeft
}

@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties

    private(set) var value: Int = 1
    
    var languageDirection: LanguageDirection = .leftToRight {
        didSet {
            guard languageDirection != oldValue else { return }
            changeRatingDirection()
        }
    }
    
    // MARK: - Private Properties

    private var starLabels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // MARK: - Actions

    @IBAction func languageDirectionToggled(_ sender: UISegmentedControl) {
        guard let selectedLanguageDirection = LanguageDirection(rawValue: sender.selectedSegmentIndex) else { return }
        
        languageDirection = selectedLanguageDirection
    }
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        for number in 1...componentCount {
            let label = UILabel()
            let widthOfSpacing = CGFloat(number * 8)
            let widthOfComponentsSoFar = componentDimension * CGFloat(number - 1)
            let labelOrigin = CGPoint(x: widthOfComponentsSoFar + widthOfSpacing, y: 0)
            let labelSize = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: labelOrigin, size: labelSize)
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = (number == 1) ? "⭐️" : "☆"
            label.textAlignment = .center
            label.textColor = (number == 1) ? componentActiveColor : componentInactiveColor
            
            addSubview(label)
            starLabels.append(label)
        }
        
        if languageDirection == .rightToLeft {
            changeRatingDirection()
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touchPoint: CGPoint) {
        
        for starLabel in starLabels where starLabel.frame.contains(touchPoint) {
            guard value != starLabel.tag else { return }
            
            value = starLabel.tag
            
            switch languageDirection {
            case .leftToRight:
                starLabel.performFlare()
            case .rightToLeft:
                starLabel.performSpin()
            }
            break
        }
        updateComponentColors()
        sendActions(for: [.valueChanged])
    }
    
    private func changeRatingDirection() {
        for starLabel in starLabels {
            let tag = componentCount - starLabel.tag + 1
            starLabel.tag = tag
        }
        updateComponentColors()
    }
    
    private func updateComponentColors() {
        for starLabel in starLabels {
            if starLabel.tag <= value {
                starLabel.textColor = componentActiveColor
                starLabel.text = "⭐️"
            } else {
                starLabel.textColor = componentInactiveColor
                starLabel.text = "☆"
            }
        }
    }
    
    // MARK: - Touch Tracking
            
        override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            let touchPoint = touch.location(in: self)
            updateValue(at: touchPoint)
            sendActions(for: [.touchDown])
            return true
        }
        
        override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            let touchPoint = touch.location(in: self)
            if bounds.contains(touchPoint) {
                updateValue(at: touchPoint)
                sendActions(for: [.touchDragInside])
            } else {
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
                sendActions(for: [.touchUpInside])
            } else {
                sendActions(for: [.touchUpOutside])
            }
        }
        
        override func cancelTracking(with event: UIEvent?) {
            sendActions(for: [.touchCancel])
        }
    
}

// MARK: - UIView Animations

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.2,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.08) { unflare() }})
    }
    
    // "Spin view" animation sequence
    func performSpin() {
        func spin()   { layer.transform = CATransform3DMakeRotation(CGFloat.pi/2, 0, 1, 0) }
        func unspin() { layer.transform = CATransform3DIdentity }
        
        UIView.animate(withDuration: 0.1,
                       animations: { spin() },
                       completion: { _ in UIView.animate(withDuration: 0.15) { unspin() }})
    }
}
