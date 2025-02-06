


import Foundation

extension URL {
    
    private static let BASE_URL = "https://summer-nonstop-pint.glitch.me/api"
    
    static func urlForAccounts() -> URL? {
         return URL(string: "\(BASE_URL)/accounts")
    }
    
    static func urlForCreateAccounts() -> URL? {
        return URL(string: "\(BASE_URL)/accounts")
    }
}
