#!/usr/bin/env bash

set -ex

curl -fSL https://raw.githubusercontent.com/swift-aws/aws-sdk-swift-core/master/Sources/AWSSDKSwiftCore/Hash.swift -o Sources/AwsSigv4NIOSSLCrypto/Hash.swift

sed -i '' 's/^public func/func/; s/^import Foundation/import struct Foundation.Data/' Sources/AwsSigv4NIOSSLCrypto/Hash.swift

curl -fSL https://raw.githubusercontent.com/swift-aws/aws-sdk-swift-core/master/Sources/AWSSDKSwiftCore/HMAC.swift -o Sources/AwsSigv4NIOSSLCrypto/HMAC.swift

sed -i '' '/^import Foundation/d' Sources/AwsSigv4NIOSSLCrypto/HMAC.swift

