import Foundation
class NumberAsserter{
    /**
     * NOTE: In most cases you will want to write if(someNumber < 0)
     */
    static func negative<T:Comparable>(_ number:T) -> Bool{
        return number < CGFloat(0)
    }
    /**
     * NOTE: In most cases you will want to write if(someNumber >
     */
    static func positive<T:Comparable>(_ number:T , _ zero:T = CGFloat(0))->Bool {
        return number > zero
    }
}
