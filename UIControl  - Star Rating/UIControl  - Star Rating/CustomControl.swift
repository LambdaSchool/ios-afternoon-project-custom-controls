//
//  CustomControl.swift
//  UIControl  - Star Rating
//
//  Created by Mark Poggi on 4/16/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    private var value: Int = 1
    private var star = UILabel()
    private var componentDimension: CGFloat = 40.0
    private var componentCount: Int = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    private func setUpSubviews() {
        
        star.translatesAutoresizingMaskIntoConstraints = false

        var stars = [UILabel]()
        for x in 0...4 {
            let star = (UILabel(frame: CGRect(x: (CGFloat(x) * componentDimension) + (CGFloat(x) * 8.0), y: 0, width: componentDimension, height: componentDimension)))
            
            star.text = "⭐︎"
            star.textAlignment = .center
            star.textColor = componentInactiveColor
            star.font = UIFont.systemFont(ofSize: 30)
            
            star.widthAnchor.constraint(equalTo: star.heightAnchor).isActive = true
            
//            guard let starView = star as? UIView else { return }
            stars.append(star)
            addSubview(stars[x])
        }
         print(stars)
        stars[0].textColor = componentActiveColor
    }
    
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Tracking
    
    //     override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    //
    //     }
    //
    //     override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
    //
    //     }
    //
    //
    //     override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
    //
    //
    //     }
    //
    //     override func cancelTracking(with event: UIEvent?) {
    //         sendActions(for: .touchCancel)
    //
    //     }
}
