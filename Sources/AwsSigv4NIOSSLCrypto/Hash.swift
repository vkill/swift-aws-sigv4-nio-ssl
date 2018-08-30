//
//  Hash.swift
//  AWSSDKSwift
//
//  Created by Yuki Takei on 2017/03/13.
//
//

import struct Foundation.Data
import CNIOOpenSSL

func sha256(_ string: String) -> [UInt8] {
    var bytes = Array(string.utf8)
    return sha256(&bytes)
}

func sha256(_ bytes: inout [UInt8]) -> [UInt8] {
    var hash = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
    SHA256(&bytes, bytes.count, &hash)
    return hash
}

func sha256(_ data: Data) -> [UInt8] {
    return data.withUnsafeBytes {(bytes: UnsafePointer<UInt8>) in
        var hash = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
        SHA256(bytes, data.count, &hash)
        return hash
    }
}

func md5(_ data: Data) -> [UInt8] {
    return data.withUnsafeBytes {(bytes: UnsafePointer<UInt8>) in
        var hash = [UInt8](repeating: 0, count: Int(MD5_DIGEST_LENGTH))
        MD5(bytes, data.count, &hash)
        return hash
    }
}
