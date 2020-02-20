//
//  CustomControl.swift
//  ios-afternoon-project-custom-controls
//
//  Created by Lambda_School_Loaner_268 on 2/20/20.
//  Copyright © 2020 Lambda. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - INITIALIZERS
    
    required init?(coder acoder: NSCoder) {
        super.init(coder: acoder)
        setup()
            
        }
    
    
    // MARK: - PROPERTIES
    
    var value: Int = 1
    
    // MARK: - PRIVATE CONSTANTS
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private let spacing: CGFloat = 8.0
    private var position: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var size: CGSize = CGSize(width: 40, height: 40)
    var localArray: [UILabel] = []
   
    
    // MARK: - METHODS & COMPUTED PROPERTIES
    
    func updateValue(at touch: UITouch) {
        for label in localArray {
            if label.bounds.contains(touch.location(in: label)) {
                if label.tag != value {
                    value = label.tag
                    sendActions(for: .valueChanged)
                }
            }
        }
        for num in 0..<value {
            localArray[num].textColor = componentActiveColor
        }
        //set inactive labels
        for num in value..<localArray.count {
            localArray[num].textColor = componentInactiveColor
    }
}
   
    
    
    func setup() {
        // Loops over number of labels and gives me an index.
        for num in 1...5 {
            // Declare a labe;
            let label = UILabel()
            // Check if num == 1
            // If so, puts the first star in the first position (8, 0)
            if num == 1 {
                position = CGPoint(x: spacing, y: 0)
                label.textColor = componentActiveColor
                // Sets the position to the required spacing
            } else {
                position = CGPoint(x: (num * 8) + ((num - 1) * Int(componentDimension)), y: 0)
                label.textColor = componentInactiveColor
            }
            // Adds subview
            addSubview(label)
            // Adds tag
            label.tag = num
            // Assigns frame
            label.frame = CGRect(origin: position, size: size)
            // Font
            label.font = UIFont.systemFont(ofSize: 32.0, weight: .bold)
            // Star
            label.text = "✰"
            // Alignment
            label.textAlignment = .center
            // Appends
            localArray.append(label)
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
        print("begin tracking")
        let touchPoint = touch.location(in: self)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
         
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
        } else {
        updateValue(at: touch)
        }
        return true
        }
         
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
           
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchUpOutside])
        } else {
        updateValue(at: touch)
        }
        return
        }
         
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        }
    }
    

    

