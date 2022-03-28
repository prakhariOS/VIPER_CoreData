//
//  APITestCase.swift
//  VIPER_DITests
//
//  Created by prakhar gupta on 25/02/22.
//

import XCTest

@testable import Alamofire

class APITestCase: XCTestCase
{
	func testProductListAPI()
	{
		let expectation = expectation(description: "Alamofire")
		let url = "http://5e209e06e31c6e0014c60962.mockapi.io/api/productss"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON
		{ response in

			XCTAssertNotNil(response)
			XCTAssertNil(response.result.error)
			expectation.fulfill()
        }

		waitForExpectations(timeout: 10) { (error) in
			if let error = error {
				XCTFail("error: \(error)")
			}
		}
	}
}
