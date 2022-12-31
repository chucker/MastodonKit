//
//  File.swift
//  MastodonKitTests
//
//  Created by Sören Kuklau on 31.12.22.
//

@testable import MastodonKit
import XCTest

class FilterTests: XCTestCase {
    func testUpdateWholeWord() {
        let request = FilterRequests.update(id: "42", phrase: "boobies", context: [Filter.Context.home], irreversible: true, wholeWord: true)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/filters/42")

        // Method
        XCTAssertEqual(request.method.name, "PUT")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertEqual(payload, #"phrase=boobies&irreversible=true&whole_word=true&context[]=home"#)
    }

    func testUpdateNonWholeWord() {
        let request = FilterRequests.update(id: "42", phrase: "boobies", context: [Filter.Context.home], irreversible: false, wholeWord: false)

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/filters/42")

        // Method
        XCTAssertEqual(request.method.name, "PUT")
        XCTAssertNil(request.method.queryItems)
        XCTAssertNotNil(request.method.httpBody)

        let payload = String(data: request.method.httpBody!, encoding: .utf8)!
        XCTAssertEqual(payload.components(separatedBy: "&").count, 4)
        XCTAssertEqual(payload, #"phrase=boobies&irreversible=false&whole_word=false&context[]=home"#)
    }
}
