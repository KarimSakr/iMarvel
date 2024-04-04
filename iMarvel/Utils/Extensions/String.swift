//
//  String.swift
//  iMarvel
//
//  Created by Karim Sakr on 04/04/2024.
//

import Foundation
import CommonCrypto

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
