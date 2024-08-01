//
//  KeychainService.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 19.05.2024.
//

import Foundation

enum KeychainError: Error {
    case duplicateItem
    case unknown(status: OSStatus)
}

public class KeychainService {
    enum AccountType: String {
        case xToken = "X-Token"     //Authorisation Token for Content-Type
        case sToken = "SMS-Token"      //Token for get sms code
    }
    
    static func save(data: Data, account: AccountType) throws -> String {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account.rawValue,
            kSecValueData: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status != errSecDuplicateItem else { throw KeychainError.duplicateItem }
        guard status == errSecSuccess else { throw KeychainError.unknown(status: status) }
        return "Saved"
    }
    
    static func getTokenFromKeychain(for account: AccountType) throws -> Data? {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account.rawValue,
            kSecReturnData: kCFBooleanTrue as Any
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        guard status == errSecSuccess else { throw KeychainError.unknown(status: status) }
        return result as? Data
    }
    
    static func deleteData(account: AccountType) throws {
        let query: [CFString: Any] = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account.rawValue,
            kSecReturnData: kCFBooleanTrue as Any
        ]
        
        // SecItemDelete attempts to perform a delete operation
        // for the item identified by query. The status indicates
        // if the operation succeeded or failed.
        let status = SecItemDelete(query as CFDictionary)
        
        // Any status other than errSecSuccess indicates the
        // delete operation failed.
        guard status == errSecSuccess else { throw KeychainError.unknown(status: status) }
    }
}
