//
//  CustomControl.swift
//  Star Rating
//
//  Created by Jon Bash on 2019-11-07.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    var components = [UILabel]()
    
    let componentCount: Int = 5
    let componentDimension: CGFloat = 40
    let componentSpaceInterval: CGFloat = 8
    let componentActive = (color: UIColor.systemYellow, text: "★")
    let componentInactive = (color: UIColor.tertiaryLabel, text: "☆")
    
    var isLtRLocale: Bool = true
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        // set bool for locale
        isLtRLocale = effectiveUserInterfaceLayoutDirection == .leftToRight
        
        // make labels
        var starLabels = [UILabel]()
        for i in 0..<componentCount {
            let starLabel = UILabel(frame: CGRect(
                x: CGFloat(i) * (componentSpaceInterval + componentDimension) + componentSpaceInterval,
                y: 0,
                width: componentDimension,
                height: componentDimension
            ))
            starLabel.tag = isLtRLocale ? i + 1 : componentCount - i
            starLabel.font = .boldSystemFont(ofSize: 32)
            starLabel.textAlignment = .center
            if starLabel.tag == 1 {
                starLabel.text = componentActive.text
                starLabel.textColor = componentActive.color
            } else {
                starLabel.text = componentInactive.text
                starLabel.textColor = componentInactive.color
            }
            
            addSubview(starLabel)
            starLabels.append(starLabel)
        }
        components = starLabels
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * componentSpaceInterval
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Update Methods
    
    func updateValue(at touch: UITouch) {
        for label in components {
            if label.frame.contains(touch.location(in: self)) && label.tag != value {
                label.performFlare(increasingSpin: label.tag > value)
                value = label.tag
                sendActions(for: .valueChanged)
                updateAppearanceFromValue()
            }
        }
    }
    
    func updateAppearanceFromValue() {
        for label in components {
            if label.tag <= value {
                label.textColor = componentActive.color
                label.text = componentActive.text
            } else {
                label.textColor = componentInactive.color
                label.text = componentInactive.text
            }
        }
    }
}

// MARK: - Animation

extension UIView {
    // "Flare view" animation sequence
    func performFlare(increasingSpin: Bool) {
        // set localization to change spin-direction because I'm insufferably fiddly with these details
        let isLtRLocale = effectiveUserInterfaceLayoutDirection == .leftToRight
        let spinDir: CGFloat = increasingSpin ? 1 : -1
        let sign: CGFloat = isLtRLocale ? spinDir : -spinDir
        
        let scale: CGFloat = 1.4
        let duration = 0.4
        
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                self.transform = self.transform.rotated(by: 2 * CGFloat.pi / 3 * sign).scaledBy(x: sqrt(scale), y: sqrt(scale))
            }
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                self.transform = self.transform.rotated(by: 2 * CGFloat.pi / 3 * sign).scaledBy(x: sqrt(scale), y: sqrt(scale))
            }
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
                self.transform = .identity
            }
        })
    }
}
