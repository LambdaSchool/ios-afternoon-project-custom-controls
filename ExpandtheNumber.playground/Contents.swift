import UIKit

var numbers: [String] = []

func expandTheNumber(num: Int) {
    let characters = String(num)
    let amt = characters.count
    let first = characters.prefix(1)
    let firstConverted = Int(first)
    let firstMultiplied = firstConverted! * (amt)
    print(firstMultiplied)
    print(firstConverted)
    print(first)
//    for a in 1...amt {
//        print(characters[a])
//       // numbers.append(characters[a])
//    }
    
}
 expandTheNumber(num: 450)
