//
//  ViewController.swift
//  StarRating
//
//  Created by Chris Gonzales on 2/20/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    @IBAction func customCell(_ sender: CustomControl) {

        if sender.value == 1 {
            self.title = "User Rating: 1 star"
            } else {
            self.title = "User Rating: \(sender.value) stars"
            }
    }
}

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
