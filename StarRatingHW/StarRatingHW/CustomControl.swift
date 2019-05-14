//
//  CustomControl.swift
//  StarRatingHW
//
//  Created by Michael Flowers on 5/14/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInActiveColor: UIColor = .gray
    var labelArray: [UILabel] = []
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    //MARK: - Build the control view
        //these are built without auto layout, using a view's frame property to specify where each subviews lies.
    
    func setup(){
        //use a loop to create five labels, add each one as a subview and append to the array
        for index in 1...componentCount {
            let label = UILabel()
            label.tag = index
            
            //we need to create the frame. Remember the frame takes in the x position, y position, width and height
            //because we need to move the x position for every label we have to do a bit of calculation, so offset will be the x position
            let offset = CGFloat(index - 1) * componentDimension + CGFloat(index) * 8.0 //0 * 40 = 0, + 1 * 8...we want the view to be 8 points from each other--NOT SURE WHY WE HAVE THE DIMENSIONS IN THE CALCULATION
            
            // now that we have the x, and we know that y will be 0 we can configure the origin, where it begains in our control
            //step 1 is to get the x and y for the origin
            let origin = CGPoint(x: offset, y: 0.0)
            
            //step 2 is to get the size. position then size
            //now that we have the origin we can construct the size
            let size = CGSize(width: componentDimension, height: componentDimension)
            
            //step 3 now that we have the position ( x and y ) and the size ( width and height ) we can create the frame for the label
            label.frame = CGRect(origin: origin, size: size)
            
            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center
            
            if label.tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInActiveColor
            }
            addSubview(label)
        }
    }
    
    //this sets up how big the customControl size is, the one above creates the label size/width/position
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
