//
//  ViewController.swift
//  StarRating
//
//  Created by Tobi Kuyoro on 23/01/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
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
