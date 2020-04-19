//
//  ViewController.swift
//  UIControl-StarRating
//
//  Created by David Williams on 4/16/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let black: CGColor = UIColor.black.cgColor//
    let yellow: CGColor = UIColor.yellow.cgColor
    let red: CGColor = UIColor.red.cgColor//
    let orange: CGColor = UIColor.orange.cgColor
    let cyan: CGColor = UIColor.cyan.cgColor
    let purple: CGColor = UIColor.purple.cgColor
    let white: CGColor = UIColor.white.cgColor//
    let blue: CGColor = UIColor.blue.cgColor//
    let grey: CGColor = UIColor.gray.cgColor
    
 let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(one: grey, two: grey, three: grey, four: grey, five: grey)
        self.title = "User Rating: 1 star."
    }
   
    func updateViews(one: CGColor, two: CGColor, three: CGColor, four: CGColor, five: CGColor) {
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [one, two, three, four, five]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
         if ratingControl.value == 1 {
            self.title = "User Rating: 1 star."
        } else {
            self.title = "User Rating: \(ratingControl.value) stars."
        }
        switch ratingControl.value {
        case 1:
            updateViews(one: red, two: white, three: white, four: blue, five: black)
        case 2:
           updateViews(one: white, two: red, three: white, four: blue, five: black)
        case 3:
            updateViews(one: white, two: white, three: red, four: blue, five: black)
        case 4:
            updateViews(one: white, two: white, three: blue, four: red, five: black)
        case 5:
            updateViews(one: white, two: white, three: blue, four: black, five: red)
        case 6:
            updateViews(one: cyan, two: cyan, three: orange, four: cyan, five: cyan)
        default:
            break
        }
    }
}



