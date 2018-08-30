#!/usr/bin/env bash

set -ex

curl -fSL https://raw.githubusercontent.com/swift-aws/aws-sdk-swift-core/master/Sources/AWSSDKSwiftCore/Hash.swift -o Sources/AwsSigv4CNIOSSL/Hash.swift

curl -fSL https://raw.githubusercontent.com/swift-aws/aws-sdk-swift-core/master/Sources/AWSSDKSwiftCore/HMAC.swift -o Sources/AwsSigv4CNIOSSL/HMAC.swift

