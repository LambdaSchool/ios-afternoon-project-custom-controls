//
//  CustomControl.swift
//  CustomControls
//
//  Created by Cameron Collins on 4/16/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    //MARK: - Variables
    var value: Int = 1
    var labels: [UILabel] = []
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setup()
    }
    
    //MARK: - Functions
    func updateValue(at touch: UITouch) {
        //What star was touched
        for i in labels {
            if i.bounds.contains(touch.location(in: self)) {
                value = i.tag
                sendActions(for: [.valueChanged])
            }
        }
        print(value)
        
        for i in labels {
            if i.tag < value {
                i.textColor = .black
            } else {
                i.textColor = .gray
            }
        }
        
    }
    
    func setup() {
        for i in 0...4 {
            let tempLabel = UILabel()
            tempLabel.tag = i + 1
            tempLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            tempLabel.font = .systemFont(ofSize: 32.0, weight: .bold)
            tempLabel.text = "★"
            tempLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(tempLabel)
            
            if i - 1 <= value {
                tempLabel.textColor = .black
            } else {
                tempLabel.textColor = .gray
            }
            
            if i != 0 {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: labels[i-1], attribute: .leading, multiplier: 1.0, constant: componentDimension + 8.0)])
            } else {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0)])
            }
            labels.append(tempLabel)
        }
    }
    
    
    //MARK: - Touch Handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let tempTouch = touch.location(in: self)
        if bounds.contains(tempTouch) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            updateValue(at: touch)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else {
            sendActions(for: [.touchDragOutside])
            return
        }
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
