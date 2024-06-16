import XCTest
import SwiftUI
@testable import Navigation

final class NavigationTests: XCTestCase {
    func test_init() {
        let sut = getSUT()

        XCTAssertEqual(sut.stack.count, 0)
    }

    func test_push() {
        let sut = getSUT()

        sut.push(.x)

        XCTAssertEqual(sut.stack.count, 1)
    }

    func test_push_multiple() {
        let sut = getSUT()

        sut.push([.x, .y])

        XCTAssertEqual(sut.stack.count, 2)
    }

    func test_popToRoot() {
        let sut = getSUT()

        sut.push([.x, .y])

        XCTAssertEqual(sut.stack.count, 2)

        sut.popToRoot()

        XCTAssertEqual(sut.stack.count, 0)
    }

    func test_pop() throws {
        let sut = getSUT()

        sut.push([.x, .y])

        XCTAssertEqual(sut.stack.count, 2)

        sut.pop()

        XCTAssertEqual(sut.stack, [.x])
        XCTAssertEqual(sut.stack.count, 1)
    }

    func test_replace() throws {
        let sut = getSUT()

        sut.push([.x, .y, .z])

        XCTAssertEqual(sut.stack.count, 3)
        XCTAssertEqual(sut.stack, [.x, .y, .z])

        sut.replace([.z, .y, .x])

        XCTAssertEqual(sut.stack, [.z, .y, .x])
    }

    private enum MockRoutes: Routable {
        case x
        case y
        case z

        var body: some View {
            switch self {
            default:
                EmptyView()
            }
        }
    }

    private func getSUT() -> Router<MockRoutes> {
        Router()
    }
}
