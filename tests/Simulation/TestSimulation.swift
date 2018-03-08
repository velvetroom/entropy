import XCTest
@testable import entropy

internal final class TestSimulation:XCTestCase {
    private var simulation:Simulation?
    private struct Constants {
        fileprivate static let expectationWait:TimeInterval = 1
    }
    
    internal override func setUp() {
        super.setUp()
        self.simulation = Simulation()
    }
    
    internal func testLoadProject() {
        let expect:XCTestExpectation = expectation(description:"Wait for project to load")
        self.simulation?.loadProject {
            expect.fulfill()
        }
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.simulation?.project, "Error: project not loaded")
        }
    }
}
