//
//  ViewController.swift
//  UIControl-StarRating
//
//  Created by David Williams on 4/16/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
//    let gradientLayer = CAGradientLayer()
//    gradientLayer.frame = self.view.bounds
//    gradientLayer.colors = [UIColor.black.cgColor, UIColor.cyan.cgColor, UIColor.red.cgColor, UIColor.black.cgColor]
//    self.view.layer.insertSublayer(gradientLayer, at: 0)
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            self.title = "User Rating 1 star."
        } else {
            self.title = "User Rating \(ratingControl.value) stars."
        }
        switch ratingControl.value {
        case 0:
            view.backgroundColor = .darkGray
        case 1:
            view.backgroundColor = .lightGray
        case 2:
            view.backgroundColor = .cyan
        case 3:
            view.backgroundColor = .blue
        case 4:
            view.backgroundColor = .purple
        case 5:
            view.backgroundColor = .orange
        default:
            break
        }
    }
}



