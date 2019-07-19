//
//  Hash.swift
//  AWSSDKSwift
//
//  Created by Yuki Takei on 2017/03/13.
//
//

import struct Foundation.Data
import CNIOBoringSSL

func sha256(_ string: String) -> [UInt8] {
    var bytes = Array(string.utf8)
    return sha256(&bytes)
}

func sha256(_ bytes: inout [UInt8]) -> [UInt8] {
    var hash = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
    CNIOBoringSSL_SHA256(&bytes, bytes.count, &hash)
    return hash
}

func sha256(_ data: Data) -> [UInt8] {
    return data.withUnsafeBytes { ptr in
        var hash = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
        if let bytes = ptr.baseAddress?.assumingMemoryBound(to: UInt8.self) {
            CNIOBoringSSL_SHA256(bytes, data.count, &hash)
        }
        return hash
    }
}

func sha256(_ bytes1: inout [UInt8], _ bytes2: inout [UInt8]) -> [UInt8] {
    var hash = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
    var context = SHA256_CTX()
    CNIOBoringSSL_SHA256_Init(&context)
    CNIOBoringSSL_SHA256_Update(&context, &bytes1, bytes1.count)
    CNIOBoringSSL_SHA256_Update(&context, &bytes2, bytes2.count)
    CNIOBoringSSL_SHA256_Final(&hash, &context)
    return hash
}

func md5(_ data: Data) -> [UInt8] {
    return data.withUnsafeBytes { ptr in
        var hash = [UInt8](repeating: 0, count: Int(MD5_DIGEST_LENGTH))
        if let bytes = ptr.baseAddress?.assumingMemoryBound(to: UInt8.self) {
            CNIOBoringSSL_MD5(bytes, data.count, &hash)
        }
        return hash
    }
}
