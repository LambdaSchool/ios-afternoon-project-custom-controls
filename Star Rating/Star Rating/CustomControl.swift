//
//  CustomControl.swift
//  Star Rating
//
//  Created by Michael Stoffer on 6/8/19.
//  Copyright © 2019 Michael Stoffer. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        self.setup()
    }
    
    // MARK: - Methods
    private func setup() {
        var labels: [UILabel] = []
        let spacing: CGFloat = 8.0
        var xPosition: CGFloat = spacing
        
        for i in 0..<self.componentCount {
            let label = UILabel()
            addSubview(label)
            label.tag = i + 1
            labels.append(label)
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            label.frame.origin = CGPoint(x: xPosition, y: 0.0)
            xPosition += componentDimension + spacing
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            if label.tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Tracking Data
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
