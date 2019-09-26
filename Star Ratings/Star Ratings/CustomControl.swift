//
//  CustomControl.swift
//  Star Ratings
//
//  Created by Dillon P on 9/25/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 // default value of 1 is API facing i.e. customers can see
    
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // init for programmatic layouts
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // init for storyboard layouts
    required init?(coder: NSCoder) { ///if this is done a storyboard, needs to run NSCoder in order to run
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        
        var labels: [UILabel] = []
        var count = 1
        var xPos: CGFloat = 16.0
        
        for _ in 0...4 {
            let label = UILabel()
            addSubview(label)
            label.tag = count
            
            if count == 1 {
                label.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
            } else {
                label.frame = CGRect(x: xPos + componentDimension, y: 0.0, width: componentDimension, height: componentDimension)
                xPos += componentDimension + 8.0
            }
            
            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            labels.append(label)
            count += 1
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    
    
    
}
