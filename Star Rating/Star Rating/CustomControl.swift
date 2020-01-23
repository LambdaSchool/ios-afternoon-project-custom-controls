//
//  CustomControl.swift
//  Star Rating
//
//  Created by Zack Larsen on 12/12/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    var value: Int = 5
    private let componentCount = 5
    private var components: [UILabel] = []
    private let componentsDementions: CGFloat = 50
    
    private let selectedStar = UIColor.red
    private let unselectedStar = UIColor.green
    
    var labelArray = [UILabel]()
    var startValueX: CGFloat = 40
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentsDementions
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentsDementions)
    }
    
    // Sets up custom control view
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
    required   init?(coder aCoder: NSCoder){
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for component in 1 ... componentCount { /* lets us create 5 labels*/
            let label = UILabel(frame: CGRect(x: startValueX, y: 0.0, width: componentsDementions, height: componentsDementions))
            startValueX += componentsDementions + 5.0
            label.tag = component
            label.text = "❅"
            if component == 1 {
                label.textColor = selectedStar
            } else {
                label.textColor = unselectedStar
            }
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 80.0)
            addSubview(label)
            labelArray.append(label)
        }
        
        
    }
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in labelArray {
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
            }
        }
        switch value {
        case 1:
            labelArray[0].textColor = selectedStar
            labelArray[1].textColor = unselectedStar
            labelArray[2].textColor = unselectedStar
            labelArray[3].textColor = unselectedStar
            labelArray[4].textColor = unselectedStar
        case 2:
            labelArray[0].textColor = selectedStar
            labelArray[1].textColor = selectedStar
            labelArray[2].textColor = unselectedStar
            labelArray[3].textColor = unselectedStar
            labelArray[4].textColor = unselectedStar
            
        case 3:
            labelArray[0].textColor = selectedStar
            labelArray[1].textColor = selectedStar
            labelArray[2].textColor = selectedStar
            labelArray[3].textColor = unselectedStar
            labelArray[4].textColor = unselectedStar
        case 4:
            labelArray[0].textColor = selectedStar
            labelArray[1].textColor = selectedStar
            labelArray[2].textColor = selectedStar
            labelArray[3].textColor = selectedStar
            labelArray[4].textColor = unselectedStar
        case 5:
            labelArray[0].textColor = selectedStar
            labelArray[1].textColor = selectedStar
            labelArray[2].textColor = selectedStar
            labelArray[3].textColor = selectedStar
            labelArray[4].textColor = selectedStar
        default:
            break
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.touchDown])
        updateValue(at: touch)
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
}


