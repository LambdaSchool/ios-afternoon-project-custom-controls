//
//  CustomControl.swift
//  Custom Control
//
//  Created by Wyatt Harrell on 3/19/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        
        var labels: [UILabel] = []
        
        for number in 0...4 {
            let label = UILabel()
            label.tag = number + 1
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 32.0, weight: .bold)
            label.textAlignment = .center
            label.text = "★"
            label.textColor = componentInactiveColor
            addSubview(label)
            labels.append(label)
        }
        
        #warning("Constraints not setup currectly")
        NSLayoutConstraint.activate([
            labels[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            labels[1].leadingAnchor.constraint(equalTo: labels[0].trailingAnchor, constant: 16),
            labels[2].leadingAnchor.constraint(equalTo: labels[1].trailingAnchor, constant: 16),
            labels[3].leadingAnchor.constraint(equalTo: labels[2].trailingAnchor, constant: 16),
            labels[4].leadingAnchor.constraint(equalTo: labels[3].trailingAnchor, constant: 16)
        ])
        
        labels[0].textColor = componentActiveColor
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

}
