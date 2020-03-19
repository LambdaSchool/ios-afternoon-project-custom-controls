//
//  CustomControl.swift
//  StarRating
//
//  Created by Shawn Gee on 3/19/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    // MARK: - Properties
    
    var value = 1
    
    // MARK: - Private

    let componentDimension: CGFloat = 40
    let componentPadding: CGFloat = 8
    let componentCount = 5
    let componentColor = UIColor.systemPink
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        var stars = [UIImageView]()
        
        var x = componentPadding
        
        for i in 1...5 {
            let starImage = i == 1 ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            let star = UIImageView(image: starImage)
            star.tintColor = componentColor
            star.contentMode = .scaleAspectFit
            star.tag = i
            
            stars.append(star)
            
            addSubview(star)
            star.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            
            x += componentDimension + componentPadding
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at point: CGPoint) {
        
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        updateValue(at: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
      override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
          let touchPoint = touch.location(in: self)
          if bounds.contains(touchPoint) {
              updateValue(at: touchPoint)
              sendActions(for: [.touchDragInside, .valueChanged])
          } else {
              sendActions(for: .touchDragOutside)
          }

          return true
      }

      override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
          guard let touch = touch else { return }

          let touchPoint = touch.location(in: self)
          if bounds.contains(touchPoint) {
              updateValue(at: touchPoint)
              sendActions(for: [.touchUpInside, .valueChanged])
          } else {
              sendActions(for: .touchUpOutside)
          }
      }

      override func cancelTracking(with event: UIEvent?) {
          sendActions(for: .touchCancel)
      }

}
