//
//  ViewController.swift
//  iOSCustomControls
//
//  Created by Brian Rouse on 5/14/20.
//  Copyright © 2020 Brian Rouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Mark: - ViewLifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateRating(value: 1)
    }
    
    // MARK: - IBActions

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.updateRating(value: ratingControl.value)
    }

 // MARK: - Helper Methods
    
    private func updateRating(value: Int) {
        self.title = "User Rating: \(value) \(value == 1 ? "star" : "stars")"
    }
}


