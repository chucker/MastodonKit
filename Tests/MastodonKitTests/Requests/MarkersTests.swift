//
//  MarkersTests.swift
//  MastodonKitTests
//
//  Created by Sören Kuklau on 29.04.22.
//

import XCTest
@testable import MastodonKit

class MarkersTests: XCTestCase {
    func testAll_home() {
        let request = Markers.all(timelines: [.home])

        // Endpoint
        XCTAssertEqual(request.path, "/api/v1/markers")

        // Method
        XCTAssertEqual(request.method.name, "GET")
        XCTAssertEqual(request.method.queryItems?.count, 1)
        let timelineQueryItem = URLQueryItem(name: "timeline[]", value: "home")
        XCTAssertTrue(request.method.queryItems!.contains(timelineQueryItem))
        XCTAssertNil(request.method.httpBody)
    }

    func testUpdate() {
        // TODO
    }
}
