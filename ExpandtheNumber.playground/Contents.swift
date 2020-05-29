import UIKit

var numbers: [String] = []

func expandTheNumber(num: Int) -> [String] {
    let characters = String(num)
    var amt = characters.count
    while amt > 0 {
        for i in characters {
            let expandedNumbers = Int(Double(String(i))! * (pow(Double(10), (Double(String(amt-1))!))))
            numbers.append(String(expandedNumbers))
         amt -= 1
        }
    }
    return numbers
}
expandTheNumber(num: 34)

/// Solution Code to Challenge
func expandTheNumber(_ number: Int) -> [Int] {
    guard number != 0 else { return [0] }
    
    var numbers: [Int] = []
    var multiplier = 1
    var remainder = number
    
    while remainder > 0 {
        let digit = (remainder % 10) * multiplier
        numbers.insert(digit, at: 0)
        multiplier *= 10
        remainder /= 10
    }
    return numbers
}

expandTheNumber(34)
