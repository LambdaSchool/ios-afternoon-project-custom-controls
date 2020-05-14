//
//  CustomControl.swift
//  StarRating
//
//  Created by Nonye on 5/14/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    var value: Int = 1
    var starLabelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubview()
    }
    
    func setupSubview() {
        backgroundColor = .clear
        
        for i in 1...5 {
            let label = UILabel()
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✩"
            label.textAlignment = .center
            starLabelArray.append(label)
            
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    //MARK: - STACK VIEW FOR STARS
        
        let stackView = UIStackView(arrangedSubviews: starLabelArray)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.isUserInteractionEnabled = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
       
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    //MARK: - CUSTOM CONTROL
}

    
    //MARK: - BEGIN TRACKING

    
    //MARK: - CONTINUE TRACKING


    //MARK: - END TRACKING
    
    //MARK: - CANCEL TRACKING
    
    




