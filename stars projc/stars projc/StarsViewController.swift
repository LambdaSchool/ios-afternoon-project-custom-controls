//
//  StarsViewController.swift
//  stars projc
//
//  Created by Elizabeth Wingate on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

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
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value < 2 {
                 self.title = "\(ratingControl.value) star"
             }else {
                 self.title = "\(ratingControl.value) stars"
             }
    }
}
