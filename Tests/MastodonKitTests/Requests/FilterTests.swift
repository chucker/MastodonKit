//
//  File.swift
//  MastodonKitTests
//
//  Created by Sören Kuklau on 31.12.22.
//

import XCTest
@testable import MastodonKit

class FilterTests: XCTestCase {
    func testUpdate() {
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
}
