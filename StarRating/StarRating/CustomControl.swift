//
//  CustomControl.swift
//  StarRating
//
//  Created by Tobi Kuyoro on 23/01/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentInactiveColor: UIColor = .gray
    var labels: [UILabel] = []
    
    // MARK: - View Lifecycle
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 32, weight: .bold)
            label.textColor = .systemYellow
            
            let offset = CGFloat(i - 1) * componentDimension + CGFloat(i) * 8.0
            let origin = CGPoint(x: offset, y: 0)
            let size = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: origin, size: size)
            
            if label.tag == 1 {
                label.text = "⭑"
            } else {
                label.text = "⭒"
            }
            
            labels.append(label)
            addSubview(label)
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
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
    
}
