//
//  CustomControl.swift
//  StarRating
//
//  Created by Karen Rodriguez on 3/19/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    // MARK: - Private Properties
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Methods
    
    private func setup() {
        for tag in 0...4 {
            let newLabel = UILabel()
//            newLabel.translatesAutoresizingMaskIntoConstraints = false
            newLabel.tag = tag + 1
            newLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            if tag + 1 == 1 {
//                newLabel.center = CGPoint(x: 8.0, y: 0)
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.center = CGPoint(x: componentDimension + (8.0 * CGFloat(tag + 1)), y: 0)
                newLabel.textColor = componentInactiveColor
            }
            newLabel.center.y = 0.0
            newLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            newLabel.text = "✭"
            newLabel.textAlignment = .center
            labels.append(newLabel)
            addSubview(newLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
}
