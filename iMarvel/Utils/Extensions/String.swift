//
//  String.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import CommonCrypto

//MARK: - encryption
extension String {
    
    var md5: String {
        
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        data.withUnsafeBytes { bytes in
            _ = CC_MD5(bytes.baseAddress, CC_LONG(data.count), &digest)
        }
        
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}

//MARK: - email verification
extension String {
    func isEmailValid() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
