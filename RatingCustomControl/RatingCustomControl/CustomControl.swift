//
//  CustomControl.swift
//  RatingCustomControl
//
//  Created by Clayton Watkins on 5/28/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var starLabels: [UILabel] = []
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setUpViews()
    }
    
    // MARK: - Setting Up Views
    private func setUpViews(){
        
        for n in 1...componentCount {
            let label = UILabel()
            label.tag = n
            starLabels.append(label)
            addSubview(label)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            
            if n == 1{
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            let padding = CGFloat(8.0 * CGFloat(n))
            label.frame = CGRect(x: 64 + padding + (componentDimension * CGFloat(n-1)),
                                 y: 80,
                                 width: componentDimension,
                                 height: componentDimension)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}
