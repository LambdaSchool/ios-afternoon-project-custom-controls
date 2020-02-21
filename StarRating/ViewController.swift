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
    func performFlare() {
        func flare() {
            guard self.layer.animationKeys()?.count ?? 0 == 0 else { return }
            let scaleBlock = {
                UILabel.addKeyframe(withRelativeStartTime: 0,
                                    relativeDuration: 0.5) {
                                        self.transform = CGAffineTransform(scaleX: 1.6,
                                                                           y: 1.6).rotated(by: -CGFloat.pi)
                }
                UILabel.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                    self.transform = .identity
                }
            }
            UILabel.animateKeyframes(withDuration: 1,
                                     delay: 0,
                                     options: [],
                                     animations: scaleBlock,
                                     completion: nil)
            
        }
            UIView.animate(withDuration: 2,
                           animations: { flare()},
                           completion: nil)
}
}
