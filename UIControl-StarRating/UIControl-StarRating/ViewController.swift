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
    let dkGrey: CGColor = UIColor.darkGray.cgColor
    
    let gradientLayer = CAGradientLayer()
    
    var leftToRight: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        languageAlert()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews(one: red, two: white, three: white, four: blue, five: black)
        self.title = "User Rating: 1 star."
        guard let left = leftToRight else { return }
        if leftToRight == left {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        } else {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    func updateViews(one: CGColor, two: CGColor, three: CGColor, four: CGColor, five: CGColor) {
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [one, two, three, four, five]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func languageAlert() {
        let alert = UIAlertController(title: "Which language direction?", message: "Right-to-Left  Left-to-Right?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Left to Right", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.leftToRight = true
        }))
        
        alert.addAction(UIAlertAction(title: "Right to Left", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            self.leftToRight = false
        }))
        self.present(alert, animated: true)
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
        case 7:
            updateViews(one: yellow, two: white, three: dkGrey, four: cyan, five: red)
        case 8:
            updateViews(one: red, two: black, three: white, four: cyan, five: orange)
        case 9:
            updateViews(one: dkGrey, two: blue, three: dkGrey, four: cyan, five: white)
        case 10:
            updateViews(one: black, two: purple, three: grey, four: yellow, five: blue)
        default:
            break
        }
    }
}



