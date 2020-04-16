//
//  CustomControl.swift
//  StarRating
//
//  Created by Hunter Oppel on 4/16/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value = 1
    var starLabels = [UILabel]()
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    // MARK: - View Lifecycle
    
    private func setup() {
        
        for n in 1...5 {
            let star = UILabel()
            addSubview(star)
            star.tag = n
            
            starLabels.append(star)
        }
        
        for star in starLabels {
            star.text = "★"
            star.font = .boldSystemFont(ofSize: 32)
            star.textAlignment = .center
            star.translatesAutoresizingMaskIntoConstraints = false
            star.frame = CGRect(x: (componentDimension*CGFloat(star.tag-1)) + CGFloat(8*star.tag),
                                y: 0,
                                width: componentDimension,
                                height: componentDimension)
            
            NSLayoutConstraint.activate([
                star.topAnchor.constraint(equalTo: topAnchor),
                star.leadingAnchor.constraint(equalTo: leadingAnchor, constant: (componentDimension*CGFloat(star.tag-1)) + CGFloat(8*star.tag))
            ])
            if star.tag == 1 {
                star.textColor = componentActiveColor
            } else {
                star.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Controls
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
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
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Functions
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for star in starLabels {
            if star.bounds.contains(touchPoint) {
                star.performFlare()
                value = star.tag
                sendActions(for: [.valueChanged])
                for star in starLabels {
                    if star.tag <= value {
                        star.textColor = componentActiveColor
                    } else {
                        star.textColor = componentInactiveColor
                    }
                }
            }
        }
    }
}
