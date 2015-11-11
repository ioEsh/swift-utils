import Foundation
class StringParser{
    /*
     * Returns an array for every line in a string
     */
    class func paragraphs(string:String)->Array<String>{
        return split(string,"\n")
    }
	/**
     * Returns an Array of words derived from @param str by splitting it at every @param delimiter
     * EXAMPLE: components("Berlin, Paris, New York, San Francisco")//Returns an array with the following values:  ["Berlin", " Paris", " New York", " San Francisco"]
	 * NOTE: use "\n" to retrive paragraphs
     */
	class func split(string:String,_ delimiter:String)->Array<String>{
		return string.componentsSeparatedByString(delimiter)
	}
    /*
     *
     */
	class func firstWord(string:String)->String {
       return string.componentsSeparatedByString(" ")[0]
    }
    /*
     * Returns the
     */
   class func lastChar(string:String)->String {
        let lastCharIndex:Int = string.characters.count - 1
        print(lastCharIndex)
        return String(string.characters.last)
    }
    /**
	 * substring("Hello from Paris, Texas!!!", 11,15); // output: Pari
	 */
    class func subString(str:String,_ beginning:Int,_ end:Int)->String{
        let startIndex = str.startIndex.advancedBy(beginning)
        let endIndex = str.startIndex.advancedBy(end-beginning)
        let range:Range = Range(start:startIndex,end:endIndex)
        return str.substringWithRange(range)
    }
    /**
     * substr("Hello from Paris, Texas!!!",11,15); // output: Paris, Texas!!!
     */
    class func subStr(str:String, _ beginning:Int,_ len:Int)->String{
        let startIndex = str.startIndex.advancedBy(beginning)
        let endIndex = str.startIndex.advancedBy(beginning+len)
        let range:Range = Range(start:startIndex,end:endIndex)
        return str.substringWithRange(range)
    }
    /*
     * Returns an array comprised of two strings that is the result of splitting the @param str
     * splitAt("Hello, playground",5)//["hello"," playground"]
     * NOTE: it may be faster to do it with this: str.substringWithRange(Range(start:str.startIndex , end:str.startIndex.advancedBy(index) ))   and str.substringWithRange(Range(start:str.startIndex.advancedBy(index) , end:str.endIndex ))
     */
	class func splitAt(str:String, _ index:Int)->Array<String> {
		let a:String =  subStr(str,0,index)
		let b:String =  subStr(str,index,str.characters.count)
		return [a,b]
	}
    /*
     * Counts how many times a string appears in a string
     */
    class func occurrences(){
        //impliment this
    }
    /**
     * Returns the index of the first match of @param b in @param a
     */
    class func indexOf(a:String,_ b:String)->Int{
        let range:Range<String.Index> = StringRangeParser.rangeOf(a,b)
        return a.startIndex.distanceTo(range.startIndex)
    }
    /**
     * Returns str sans the first char
     * @Note does not modify the original string
     */
    class func sansPrefix(str:String)->String{
        return String(str.characters.dropFirst())
    }
    /**
     * Returns str sans the last char
     * @Note does not modify the original string
     */
    class func sansSuffix(str:String)->String{
        return String(str.characters.dropLast())
    }
    /**
     * Returns a digit as a Number or a String type (suffix are removed from the return value)
     * @param string can be 10, 20px, -20px, 0.2px, -.2, 20%, 0.2
     * @return a Numberor a String type
     * @Note if the digit has a trailing % character it is returned as a String
     */
    class func digit(string:String)->Double{
        let pattern:String = "^(\\-?\\d*?\\.?\\d*?)(px|$)"// :TODO: possible rewrite: \-?\d*?(\.?)((?1)\d+?(?=px) or alike
        let matches = RegExp.matches(string, pattern)
        let match:NSTextCheckingResult = matches[0]
        let value:String = RegExp.value(string, match, 2)
        return Double(value)!
    }
}
