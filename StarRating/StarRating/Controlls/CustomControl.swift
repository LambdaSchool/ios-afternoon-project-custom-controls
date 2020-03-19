//
//  CustomControl.swift
//  StarRating
//
//  Created by Lambda_School_Loaner_259 on 3/19/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties
    static var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        //backgroundColor = .clear
        var ratingArray: [UILabel] = []
        for i in 1...5 {
            let label = UILabel()
            addSubview(label)
            label.tag = i
            if i == 1 {
                label.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentActiveColor
            } else {
                label.frame = CGRect(x: (CGFloat(i) * 8.0) + ((CGFloat(i) - 1.0) * componentDimension),
                                                     y: CGFloat(0.0),
                                                     width: componentDimension,
                                                     height: componentDimension)
                label.textColor = componentInactiveColor
            }
            label.font = .boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            label.text = "✮"
            ratingArray.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
