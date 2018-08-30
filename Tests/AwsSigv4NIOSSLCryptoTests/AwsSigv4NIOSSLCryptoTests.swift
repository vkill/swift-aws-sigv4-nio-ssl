import XCTest
@testable import AwsSigv4NIOSSLCrypto

final class AwsSigv4NIOSSLCryptoTests: XCTestCase {
    func testSHA256Digest() {
        let crypto = AwsSigv4NIOSSLCrypto()
        XCTAssertEqual(
            try crypto.sha256Digest(Data("123456".utf8)).hexEncodedString(),
            "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92"
        )
    }

    func testHMACSHA256Digest() {
        let crypto = AwsSigv4NIOSSLCrypto()
        XCTAssertEqual(
            try crypto.hmacSHA256Digest(Data("key".utf8), Data("123456".utf8)).hexEncodedString(),
            "4df81f55d708ae1720d5f65ef42f3475dc168fa23fde424ac5944f87c309b05f"
        )
    }

    static var allTests = [
        ("testSHA256Digest", testSHA256Digest),
        ("testHMACSHA256Digest", testHMACSHA256Digest),
    ]
}

// https://stackoverflow.com/questions/39075043/how-to-convert-data-to-hex-string-in-swift
extension Data {
    struct HexEncodingOptions: OptionSet {
        let rawValue: Int
        static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
    }

    func hexEncodedString(options: HexEncodingOptions = []) -> String {
        let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
        return map { String(format: format, $0) }.joined()
    }
}
