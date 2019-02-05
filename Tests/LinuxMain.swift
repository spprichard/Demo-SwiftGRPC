import XCTest

import EchoRPCTests

var tests = [XCTestCaseEntry]()
tests += EchoRPCTests.allTests()
XCTMain(tests)