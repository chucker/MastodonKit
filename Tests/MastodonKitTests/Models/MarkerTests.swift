//
//  MarkerTests.swift
//  MastodonKit
//
//  Created by Sören Kuklau on 28.04.22.
//

import XCTest
@testable import MastodonKit

class MarkerTests: XCTestCase {
    func testMarkerFromJSON() {
        let fixture = try! Fixture.load(fileName: "Fixtures/Markers.json")
        let marker = try? MarkerCollection.decode(data: fixture)
 
        XCTAssertNotNil(marker?.home)
        XCTAssertNotNil(marker?.notifications)

        XCTAssertEqual(marker!.notifications.lastReadId, "35098814")
        XCTAssertEqual(marker!.notifications.version, 361)
        
        var components = DateComponents()
        components.year = 2019
        components.month = 11
        components.day = 26
        components.hour = 22
        components.minute = 37
        components.second = 25
        components.nanosecond = 239_000_000
        components.timeZone = TimeZone(secondsFromGMT: 0)
        XCTAssertEqual(marker!.notifications.updatedAt.timeIntervalSince1970,
                       Calendar(identifier: .gregorian).date(from: components)!.timeIntervalSince1970,
                       accuracy: 0.001)
    }
}
