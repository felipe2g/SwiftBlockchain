//
//  Block.swift
//  SwiftBlockchain
//
//  Created by Felipe Guimarães on 28/05/21.
//

import Foundation
import CommonCrypto

class Block {
    var index: String
    var previousHash: String
    var data: String
    var hash: String
    
    init(index: String, previousHash: String, data: String, hash: String) {
        self.index = index
        self.previousHash = previousHash
        self.data = data
        self.hash = hash
    }
    
    func generateHash() -> String {
//        return ccSha256(data: self.index + self.previousHash)
        return ""
    }
    
    func getTimestamp() -> String {
        let today = Date()
        let formatter = DateFormatter()
        return formatter.string(from: today)
    }
    
    func ccSha256(data: Data) -> Data {
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))

        _ = digest.withUnsafeMutableBytes { (digestBytes) in
            data.withUnsafeBytes { (stringBytes) in
                CC_SHA256(stringBytes, CC_LONG(data.count), digestBytes)
            }
        }
        return digest
    }
}
