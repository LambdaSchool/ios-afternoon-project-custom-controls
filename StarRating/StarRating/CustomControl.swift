//
//  CustomControl.swift
//  StarRating
//
//  Created by Chris Gonzales on 2/20/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    let viewController = ViewController()
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        titleString()
    }
    
    private func titleString(){
        if value == 1 {
            viewController.title = "User Rating: \(value) star"
        } else {
            viewController.title = "User Rating: \(value) stars"
        }
    }
}
