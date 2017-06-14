import Security
import Foundation
/**
 * Examples here: https://gist.github.com/s-aska/e7ad24175fb7b04f78e7
 */
class KeyChainParser {
    /**
     * Returns password for PARAM: accountName
     * EXAMPLE: KeyChainParser.password("eonist")//123abc
     */
    static func password(_ accountName:String)->String?{
       return load(accountName)?.stringValue
    }
	/**
	 * Returns a keychain item for PARAM: key
     * EXAMPLE: KeyChainParser.load("eonist")?.stringValue//123abc
     * NOTE: kSecClassInternetPassword,kSecClassGenericPassword,kSecClassCertificate,kSecClassKey,kSecClassIdentity
	 */
    private static func load(_ key:String) -> Data? {
        let query:CFDictionary = [
            kSecClass as String:kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String:kCFBooleanTrue,
            kSecMatchLimit as String:kSecMatchLimitOne ] as CFDictionary
        //Swift.print("query: " + "\(query)")
        var dataTypeRef:AnyObject?
        let status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query, UnsafeMutablePointer($0)) }
        //Swift.print("status: " + "\(status)")
        if status == errSecSuccess {
            return dataTypeRef as? Data {
        }
        return nil
    }
}
class KeyChainUtils {
    /**
     *
     */
    static func dataValue(_ string:String)->Data{
        return string.data(using: .utf8, allowLossyConversion: false)!
        //return string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    }
    /**
     *
     */
    static func stringValue(_ data:Data)->String{
        return NSString(data: data, encoding: String.Encoding.utf8.rawValue) as! String
    }
}
extension String {
    public var dataValue: Data {
        return KeyChainUtils.dataValue(self)
    }
}
extension Data {
    public var stringValue: String {
        return KeyChainUtils.stringValue(self)
    }
}
