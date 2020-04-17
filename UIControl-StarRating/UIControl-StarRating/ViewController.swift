//
//  ViewController.swift
//  UIControl-StarRating
//
//  Created by David Williams on 4/16/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let black: CGColor = UIColor.black.cgColor
    let yellow: CGColor = UIColor.yellow.cgColor
    let red: CGColor = UIColor.red.cgColor
    let orange: CGColor = UIColor.orange.cgColor
    let cyan: CGColor = UIColor.cyan.cgColor
    let purple: CGColor = UIColor.purple.cgColor
    let white: CGColor = UIColor.white.cgColor
    let blue: CGColor = UIColor.blue.cgColor
    
 let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews(one: purple, two: orange, three: yellow, four: red, five: blue)
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
           // view.backgroundColor = .lightGray
        case 2:
            updateViews(one: black, two: yellow, three: red, four: black, five: white)
           // view.backgroundColor = .cyan
        case 3:
            updateViews(one: cyan, two: orange, three: red, four: black, five: blue)
           // view.backgroundColor = .blue
        case 4:
            updateViews(one: red, two: black, three: yellow, four: red, five: red)
           // view.backgroundColor = .purple
        case 5:
            updateViews(one: black, two: yellow, three: red, four: black, five: cyan)
          //  view.backgroundColor = .orange
        default:
            break
        }
    }
}



