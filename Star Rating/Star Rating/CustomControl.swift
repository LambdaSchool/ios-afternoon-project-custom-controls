//
//  CustomControl.swift
//  Star Rating
//
//  Created by Joel Groomer on 9/26/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        var labels: [UILabel] = []
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: componentDimension).isActive = true
            label.widthAnchor.constraint(equalToConstant: componentDimension).isActive = true
            let offset = (40 * (i - 1)) + (8 * i)
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(offset)).isActive = true
            label.font = .boldSystemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            label.textColor = i > value ? componentInactiveColor : componentActiveColor
            labels.append(label)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
