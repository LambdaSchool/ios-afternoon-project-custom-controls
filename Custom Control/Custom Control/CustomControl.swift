//
//  CustomControl.swift
//  Custom Control
//
//  Created by Bhawnish Kumar on 3/19/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    var value: Int = 1
    var starRatingLabel: [UILabel] = []
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }
    let componentCount: Int = 5
    let componentDimension: CGFloat = 40.0
    let componentActiveColor: UIColor = .yellow
    let componentInactiveColor: UIColor = .gray
    
    override var intrinsicContentSize: CGSize {
       let componentsWidth = CGFloat(componentCount) * componentDimension
       let componentsSpacing = CGFloat(componentCount + 1) * 8.0
       let width = componentsWidth + componentsSpacing
       return CGSize(width: width, height: componentDimension)
     }
    
    private func setupSubviews() {
        for starNumber in 0...componentCount {
               let starlabel = UILabel()
            starlabel.text = "⭐️"
            starlabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            starlabel.tag = starNumber
            
           }
           
         
       }
 
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
