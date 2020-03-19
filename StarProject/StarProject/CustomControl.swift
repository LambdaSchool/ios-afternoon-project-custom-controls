//
//  CustomControl.swift
//  StarProject
//
//  Created by Bradley Diroff on 3/19/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    var value = 1
    var labelArray: [UILabel] = []
    
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        for i in 1...5 {
            print(i)
            let label = UILabel()
            label.tag = i
            let xPosition = (componentDimension * CGFloat(i - 1)) + CGFloat(8 * i)
            label.frame = CGRect(x: xPosition, y: 0.0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            label.text = "☆"
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            labelArray.append(label)
            addSubview(label)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
}
