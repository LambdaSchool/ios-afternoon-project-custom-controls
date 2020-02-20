//
//  CustomControl.swift
//  StarRating
//
//  Created by Tobi Kuyoro on 20/02/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
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
            label.text = "⭑"
            label.textColor = componentActiveColor
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let offset = CGFloat(i - 1) * componentDimension + CGFloat(i) * 8.0
            let origin = CGPoint(x: offset, y: 0)
            let size = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: origin, size: size)
            
            if label.tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
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
}
