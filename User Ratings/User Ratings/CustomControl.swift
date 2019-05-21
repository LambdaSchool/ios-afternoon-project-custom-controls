//
//  CustomControl.swift
//  User Ratings
//
//  Created by Jonathan Ferrer on 5/21/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    var labels: [UILabel] = []
    var value: Int = 1

    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .green
    private let componentInactiveColor: UIColor = .gray

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }

    func setup() {
        for label in 1...5 {
            let addLabel = UILabel()
            self.addSubview(addLabel)
            addLabel.tag = label
            addLabel.text = "✭"
            addLabel.font = .systemFont(ofSize: 32, weight: .bold)
            addLabel.textAlignment = .center
            labels.append(addLabel)
        }
        labels[0].frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
        labels[0].textColor = componentActiveColor
        labels[1].frame = CGRect(x: componentDimension + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[2].frame = CGRect(x: componentDimension * 2 + 24.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[3].frame = CGRect(x: componentDimension * 3 + 32.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[4].frame = CGRect(x: componentDimension * 4 + 40.0, y: 0.0, width: componentDimension, height: componentDimension)
    }

    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }


    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

    }

    override func endEditing(_ force: Bool) -> Bool {

    }

    override func cancelTracking(with event: UIEvent?) {

    }



}
