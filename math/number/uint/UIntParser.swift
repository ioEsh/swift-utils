import Foundation

class UIntParser {
    /**
     * Adds a zero infront of a number
     */
    class func digit(n:UInt,_ numOfDigits:Int)->String{
        let stringNum:String = String(n)
        Swift.print("stringNum.count: " + "\(stringNum.count)")
        let leftOver:Int = numOfDigits - stringNum.count
        Swift.print("leftOver: " + "\(leftOver)")
        return "0" * leftOver + String(n)
    }
}
