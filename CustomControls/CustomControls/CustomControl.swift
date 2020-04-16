//
//  CustomControl.swift
//  CustomControls
//
//  Created by Cameron Collins on 4/16/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    
    //MARK: - Variables
    var value: Int = 5
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setup()
    }
    
    //MARK: - Functions
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        var labels: [UILabel] = []
        for i in 0...4 {
            let tempLabel = UILabel()
            tempLabel.tag = i + 1
            tempLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            tempLabel.font = .systemFont(ofSize: 32.0, weight: .bold)
            tempLabel.text = "★"
            tempLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(tempLabel)
            
            if i - 1 <= value {
                tempLabel.textColor = .black
            } else {
                tempLabel.textColor = .clear
            }
            
            if i != 0 {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: labels[i-1], attribute: .leading, multiplier: 1.0, constant: componentDimension + 8.0)])
            } else {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0)])
            }
            
            labels.append(tempLabel)
        }
    }
    
    //MARK: - Touch Handlers
    /*
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        <#code#>
    }
    
    override func cancelTracking(with event: UIEvent?) {
        <#code#>
    }
*/
        
}
