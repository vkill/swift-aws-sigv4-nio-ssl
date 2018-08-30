import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AwsSigv4CNIOSSLTests.allTests),
    ]
}
#endif