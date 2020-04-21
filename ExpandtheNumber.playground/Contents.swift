import UIKit

var numbers: [String] = []
var test = ""

func expandTheNumber(num: Int) {
    let characters = String(num)
    let amt = characters.count
    let first = characters.prefix(1)
    let firstConverted = Int(first)
    // need to convert to nth place out in 0s
   
    
    for _ in 1...amt-1 {
        let zero = "0"
        let place = test + zero
       // numbers.append(characters[a])
       test = place
        
    }
   
print(first + test)
    
}
 expandTheNumber(num: 450)
