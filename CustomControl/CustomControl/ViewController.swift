//
//  ViewController.swift
//  CustomControl
//
//  Created by Norlan Tibanear on 7/29/20.
//  Copyright © 2020 Norlan Tibanear. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navTitle(value: 1)
    }
    
    // Actions
    @IBAction func updateRating(_ sender: CustomControl) {
        navTitle(value: sender.value)
        
    }
    
    func navTitle(value: Int) {
        if value == 1 {
            self.title = "User Rating: \(value) Star"
        } else {
            self.title = "User Rating: \(value) Stars"
        }
    }
    


}

