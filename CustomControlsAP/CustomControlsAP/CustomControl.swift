//
//  CustomControl.swift
//  CustomControlsAP
//
//  Created by Jorge Alvarez on 1/23/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import Foundation
import UIKit

/*
 3 Add a new Int-typed variable property called value to your class. It's initial value should be 1. This property is API-facing, so clients will be able to see it. It establishes your control as a value-providing (and value-changing) type.
 4 In Interface builder, add a new view. Change the background color in the Attributes Inspector so it's visible. Don't worry about the color you pick. This is just to make it easier to work with.
 5 Use the Identity Inspector to set the class to Custom Control.
 6 Center it with Auto Layout but don't set any rules about size. Instead, your type will use an intrinsic size to tell Auto Layout how big it will be.
 7 In the Size Inspector, select Ambiguity > Verify Position Only. This supports your "no-size" layout.
 8 Use Ctrl-drag to connect your view to ViewController.swift with an IBAction. Note the "Event" pop-up currently set to "Value Changed". Look at the other options in the pop-up (like "Touch Down" and "Touch Drag Inside") but keep the event set to "Value Changed". Name your IBAction updateRating. This method allows the control's client (in this case your view controller) to receive updates about changes in the rating control.
 9 Edit the new method's signature to: @IBAction func updateRating(_ ratingControl: CustomControl). This keeps you from having to cast the sender to the right class.
 10 Implement updateRating. Set the view controller's title to the string "User Rating: N stars" where N is the number of stars. This number is the control's visible value property.
 11 Stretch: Fix the title so it's correct for 1 ("star" not "stars") as well as 2-5.
 */

class CustomControl: UIControl {
    var value: Int = 1
}
