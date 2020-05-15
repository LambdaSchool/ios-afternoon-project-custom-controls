//
//  ViewController.swift
//  CustomControls_iOS17
//
//  Created by Stephanie Ballard on 5/14/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationTitle(value: 1)
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationTitle(value: ratingControl.value)
    }
    
    func navigationTitle(value: Int) {
        if value == 1 {
            self.title = "User Rating: \(value) Star."
        } else {
            self.title = "User Rating: \(value) Stars."
        }
    }
}

