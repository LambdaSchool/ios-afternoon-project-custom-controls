//
//  CustomControl.swift
//  CustomControls
//
//  Created by Matthew Martindale on 4/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        var labelArray: [UILabel] = []
        var labelTag = 0
        for _ in 1...5 {
            let label = UILabel()
            labelTag += 1
            label.tag = labelTag
            addSubview(label)
            labelArray.append(label)
        }
    }
}
