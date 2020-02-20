//
//  CustomControl.swift
//  stars projc
//
//  Created by Elizabeth Wingate on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value = 1
    
    let componentDimension: CGFloat = 40
    let componentCount: Int = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .darkGray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
               setup()
  }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Functions
    func setup() {
        var spacer: CGFloat = 8.0

        for index in 1...componentCount {
            let label = UILabel(frame: CGRect(x: spacer, y: 0, width: componentDimension, height: componentDimension))
            spacer += 8 + componentDimension
            label.text = "★"
            label.font = .boldSystemFont(ofSize: 32.0)
            label.tag = index

            if index == 1 {
                label.textColor = componentActiveColor
            }else {
                label.textColor = componentInactiveColor
            }
            self.addSubview(label)
    }
  }
}
