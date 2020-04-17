//
//  StarControl.swift
//  UIControls stars
//
//  Created by Bhawnish Kumar on 4/16/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class StarControl: UIControl {

    var value: Int = 1
      private let componentDimension: CGFloat = 40.0
      private let componentCount = 5
      private let componentActiveColor: UIColor = .red
      private let componentInactiveColor: UIColor = .gray
      private var stars: [UILabel] = []
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          setup()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          setup()
      }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
