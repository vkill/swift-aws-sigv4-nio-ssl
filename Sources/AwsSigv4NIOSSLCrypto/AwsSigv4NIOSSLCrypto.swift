import AwsSigv4
import struct Foundation.Data

public struct AwsSigv4NIOSSLCrypto: AwsSigv4Crypto {
    public init() {
    }

    public func sha256Digest(_ value: Data) throws -> Data {
        return Data(bytes: sha256(value))
    }

    public func hmacSHA256Digest(_ key: Data, _ value: Data) throws -> Data {
        let key = [UInt8](key)

        return Data(bytes: hmac(string: String(decoding: value, as: UTF8.self), key: key))
    }
}
