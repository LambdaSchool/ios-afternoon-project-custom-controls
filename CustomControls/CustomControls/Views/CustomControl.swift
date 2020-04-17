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
    private let componentActiveColor: UIColor = #colorLiteral(red: 0.08015998453, green: 0.2788668573, blue: 0.3865089417, alpha: 1)
    private let componentInactiveColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        var labelArray: [UILabel] = []
        var labelTag = 0
        for _ in 1...5 {
            let label = UILabel()
            labelTag += 1
            label.tag = labelTag
            
            label.text = "★"
            label.textColor = componentActiveColor
            addSubview(label)
            labelArray.append(label)
            
            label.frame.size.width = componentDimension
            label.frame.size.height = componentDimension
            label.font = UIFont.boldSystemFont(ofSize: 32)
            
            stackView.addArrangedSubview(label)
        }
    }
}
