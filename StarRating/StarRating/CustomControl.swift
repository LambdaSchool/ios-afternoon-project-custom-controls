//
//  CustomControl.swift
//  StarRating
//
//  Created by Shawn Gee on 3/19/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    // MARK: - Properties
    
    var value = 1 {
        didSet {
            if oldValue != value {
                sendActions(for: .valueChanged)
            }
        }
    }
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Private

    private let componentDimension: CGFloat = 40
    private let componentPadding: CGFloat = 8
    private let componentCount = 5
    private let componentColor = UIColor.systemPink
    
    private var components = [UIImageView]()
    

    private func setup() {
        var x = componentPadding
        
        for i in 1...5 {
            let starImage = i == 1 ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            let star = UIImageView(image: starImage)
            star.tintColor = componentColor
            star.contentMode = .scaleAspectFit
            
            components.append(star)
            
            addSubview(star)
            star.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            
            x += componentDimension + componentPadding
        }
    }
    
    private func updateValue(at touch: UITouch) {
        for i in 0..<components.count {
            let touchPoint = touch.location(in: components[i])
            
            if components[i].bounds.contains(touchPoint) {
                for j in 0..<components.count {
                    components[j].image = i >= j ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
                }
                value = i + 1
                break
            }
        }
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
            sendActions(for: .touchDragOutside)
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
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    
    // MARK: - Size
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * componentPadding
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }

}
