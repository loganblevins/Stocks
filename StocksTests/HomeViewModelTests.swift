//
//  HomeViewModelTests.swift
//  HomeViewModelTests
//
//  Created by Logan Blevins on 6/16/24.
//

import XCTest
@testable import Stocks

final class HomeViewModelTests: XCTestCase {

    func test_initHasNoStatus() {
        let store = MockStore(stocks: .anyStocks())
        let sut = getSUT(store: store)

        XCTAssertNil(sut.status)
    }

    func test_fetchProducesStatus() throws {
        let store = MockStore(stocks: .anyStocks())
        let sut = getSUT(store: store)

        sut.fetch()

        let status = try awaitPublisher(sut.$status)

        XCTAssertNotNil(status)
    }

    func test_fetchProducesSuccess() throws {
        let store = MockStore(stocks: .anyStocks())
        let sut = getSUT(store: store)

        sut.fetch()

        let status = try awaitPublisher(sut.$status)
        let unwrappedStatus = try XCTUnwrap(status)

        switch unwrappedStatus {
        case .error:
            XCTFail()
        case .success(let stocks):
            XCTAssertEqual(stocks.count, 3)
        }
    }

    func test_fetchProducesSuccess_changesData() throws {
        let store = MockStore(stocks: .anyStocks())
        let sut = getSUT(store: store)

        sut.fetch()

        let status = try awaitPublisher(sut.$status)
        let unwrappedStatus = try XCTUnwrap(status)

        switch unwrappedStatus {
        case .error:
            XCTFail()
        case .success(let stocks):
            XCTAssertEqual(stocks.count, 3)
        }

        store.stocks = .anyStocks(count: 999)
        sut.fetch()

        let status_two = try awaitPublisher(sut.$status)
        let unwrappedStatus_two = try XCTUnwrap(status_two)

        switch unwrappedStatus_two {
        case .error:
            XCTFail()
        case .success(let stocks):
            XCTAssertEqual(stocks.count, 999)
        }
    }

    func test_fetchProducesError() throws {
        let store = MockStore(error: DataStoreError.transport(-1))
        let sut = getSUT(store: store)

        sut.fetch()

        let status = try awaitPublisher(sut.$status)
        let unwrappedStatus = try XCTUnwrap(status)

        switch unwrappedStatus {
        case .error(let error):
            XCTAssertTrue(error is DataStoreError)
        case .success:
            XCTFail()
        }
    }

    func test_fetchProducesError_fetchProducesSuccess() throws {
        let store = MockStore(error: DataStoreError.transport(-1))
        let sut = getSUT(store: store)

        sut.fetch()

        let status = try awaitPublisher(sut.$status)
        let unwrappedStatus = try XCTUnwrap(status)

        switch unwrappedStatus {
        case .error(let error):
            XCTAssertTrue(error is DataStoreError)
        case .success:
            XCTFail()
        }

        store.error = nil
        store.stocks = .anyStocks(count: 999)
        sut.fetch()

        let status_two = try awaitPublisher(sut.$status)
        let unwrappedStatus_two = try XCTUnwrap(status_two)

        switch unwrappedStatus_two {
        case .error:
            XCTFail()
        case .success(let employees):
            XCTAssertEqual(employees.count, 999)
        }
    }

    func test_emptySortedStocks() throws {
        let sut = getSUT()

        sut.fetch()

        _ = try awaitPublisher(sut.$status)

        let sorted = sut.sortedStocks

        XCTAssertTrue(sorted.isEmpty)
    }

    func test_sortedStocks() throws {
        let store = MockStore(stocks: [.anyStock(ticker: "c"), .anyStock(ticker: "a"), .anyStock(ticker: "b")])
        let sut = getSUT(store: store)

        sut.fetch()

        _ = try awaitPublisher(sut.$status)

        let sorted = sut.sortedStocks

        XCTAssertFalse(sorted.isEmpty)

        XCTAssertEqual(sorted[0].ticker, "a")
        XCTAssertEqual(sorted[1].ticker, "b")
        XCTAssertEqual(sorted[2].ticker, "c")
    }

    func getSUT(store: some DataStore = MockStore(stocks: [])) -> HomeViewModel {
        HomeViewModel(dataStore: store)
    }
}
