import XCTest
@testable import MastodonKit

class StatusesTests: XCTestCase {
    static var allTests = [
        ("testStatusByID", testStatus),
        ("testContext", testContext),
        ("testCard", testCard),
        ("testRebloggedBy", testRebloggedBy),
        ("testFavouritedBy", testFavouritedBy),
        ("testCreateWithMessage", testCreateWithMessage),
        ("testCreateWithMessageAndReplyID", testCreateWithMessageAndReplyID),
        ("testCreateWithSensitiveMessage", testCreateWithSensitiveMessage),
        ("testCreateWithSpoilerMessage", testCreateWithSpoilerMessage),
        ("testCreateWithUnlistedMessage", testCreateWithUnlistedMessage)
    ]

    func testStatus() {
        let resource = Statuses.status(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testContext() {
        let resource = Statuses.context(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/context")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testCard() {
        let resource = Statuses.card(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/card")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testRebloggedBy() {
        let resource = Statuses.rebloggedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/reblogged_by")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testFavouritedBy() {
        let resource = Statuses.favouritedBy(id: 42)

        XCTAssertEqual(resource.path, "/api/v1/statuses/42/favourited_by")
        XCTAssertEqual(resource.httpMethod, "GET")
        XCTAssertNil(resource.parameters)
        XCTAssertNotNil(resource.parse)
    }

    func testCreateWithMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!")

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, "POST")

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertNotNil(resource.parse)
    }

    func testCreateWithMessageAndReplyID() {
        let resource = Statuses.create(status: "The most awesome status message ever!", replyToID: 42)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedReplyToID = URLQueryItem(name: "in_reply_to_id", value: "42")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, "POST")

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedReplyToID))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertNotNil(resource.parse)
    }

    func testCreateWithSensitiveMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", sensitive: true)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedSensitive = URLQueryItem(name: "sensitive", value: "true")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, "POST")

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedSensitive))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertNotNil(resource.parse)
    }

    func testCreateWithSpoilerMessage() {
        let resource = Statuses.create(status: "Can't believe it's an amusement park like Westworld!", spoilerText: "Last night's GoT!!!")

        let expectedStatus = URLQueryItem(name: "status", value: "Can't believe it's an amusement park like Westworld!")
        let expectedSpoilerMessage = URLQueryItem(name: "spoiler_text", value: "Last night's GoT!!!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "public")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, "POST")

        XCTAssertEqual(resource.parameters?.count, 3)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedSpoilerMessage))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertNotNil(resource.parse)
    }

    func testCreateWithUnlistedMessage() {
        let resource = Statuses.create(status: "The most awesome status message ever!", visibility: .unlisted)

        let expectedStatus = URLQueryItem(name: "status", value: "The most awesome status message ever!")
        let expectedVisibility = URLQueryItem(name: "visibility", value: "unlisted")

        XCTAssertEqual(resource.path, "/api/v1/statuses")
        XCTAssertEqual(resource.httpMethod, "POST")

        XCTAssertEqual(resource.parameters?.count, 2)
        XCTAssertTrue(resource.parameters!.contains(expectedStatus))
        XCTAssertTrue(resource.parameters!.contains(expectedVisibility))

        XCTAssertNotNil(resource.parse)
    }
}