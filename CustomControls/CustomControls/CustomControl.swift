//
//  CustomControl.swift
//  CustomControls
//
//  Created by Jordan Christensen on 9/13/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        for i in 1...5 {
            let label = UILabel()
            label.tag = i
            
            label.frame.size.width = componentDimension
            label.frame.size.height = componentDimension
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "❆"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            
            labels.append(label)
            addSubview(label)
        }
        
        NSLayoutConstraint.activate([labels[0].centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     labels[0].leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)])
        
        NSLayoutConstraint.activate([labels[1].centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     labels[1].leadingAnchor.constraint(equalTo: labels[0].trailingAnchor, constant: 8)])
        
        NSLayoutConstraint.activate([labels[2].centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     labels[2].leadingAnchor.constraint(equalTo: labels[1].trailingAnchor, constant: 8)])
        
        NSLayoutConstraint.activate([labels[3].centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     labels[3].leadingAnchor.constraint(equalTo: labels[2].trailingAnchor, constant: 8)])
        
        NSLayoutConstraint.activate([labels[4].centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     labels[4].trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 8)])
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
