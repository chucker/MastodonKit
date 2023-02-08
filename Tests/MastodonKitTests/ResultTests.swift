//
//  ResultTests.swift
//  MastodonKit
//
//  Created by Ornithologist Coder on 6/9/17.
//  Copyright © 2017 MastodonKit. All rights reserved.
//

@testable import MastodonKit
import XCTest

class ResultTests: XCTestCase {
    func testSuccessWithoutPagination() {
        let result = Result<Response, Error>.success(Response(value: "foo", pagination: nil))

        XCTAssertFalse(result.isError)

        switch result {
        case .success(let response):
            XCTAssertEqual(response.value, "foo")
            XCTAssertNil(response.pagination)
        default:
            XCTFail()
        }
    }

    func testSuccessWithPagination() {
        let pagination = Pagination(next: .default, previous: .limit(42))
        let result = Result<Response, Error>.success(Response(value: "foo", pagination: pagination))

        XCTAssertFalse(result.isError)

        switch result {
        case .success(let response):
            XCTAssertEqual(response.value, "foo")
            XCTAssertEqual(response.pagination, pagination)
        default:
            XCTFail()
        }
    }

    func testError() {
        let result = Result<Response<Any>, Error>.failure(ClientError.malformedURL)

        switch result {
        case .failure(let error):
            XCTAssertNotNil(error)
            XCTAssertTrue(result.isError)
        default:
            XCTFail()
        }
    }
}
