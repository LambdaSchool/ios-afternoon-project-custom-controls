//
//  ViewController.swift
//  Custom Controls
//
//  Created by Jake Connerly on 8/13/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "1 Star"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value < 2 {
            self.title = "\(ratingControl.value) star"
        }else {
            self.title = "\(ratingControl.value) stars"
        }
        
    }
    
    
}
