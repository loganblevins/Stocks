//
//  StockTests.swift
//  StocksTests
//
//  Created by Logan Blevins on 6/16/24.
//

import XCTest
@testable import Stocks

final class StockTests: XCTestCase {
    func test_holdingsWithNoQuantity() {
        let sut = getSUT(priceCents: 100)

        XCTAssertEqual(sut.holdingsPriceCents, 0)
    }

    func test_holdingsWithQuantity() {
        let sut = getSUT(priceCents: 100, quantity: 2)

        XCTAssertEqual(sut.holdingsPriceCents, 200)
    }

    func test_currentPriceTimeUpdated() {
        let sut = getSUT()

        XCTAssertEqual(sut.currentPriceTimeUpdated, "6/16/2024, 20:33")
    }

    func getSUT(priceCents: Int = 1, quantity: Int? = nil) -> Stock {
        .anyStock(currentPriceCents: priceCents, quantity: quantity)
    }
}
