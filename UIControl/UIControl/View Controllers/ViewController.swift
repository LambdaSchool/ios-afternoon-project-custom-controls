//
//  ViewController.swift
//  UIControl
//
//  Created by Bree Jeune on 4/23/20.
//  Copyright © 2020 Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
                title = "User Rating: \(ratingControl.value) star!"
            } else if ratingControl.value > 1 {
                title = "User Rating: \(ratingControl.value) stars!"
            }
        }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
