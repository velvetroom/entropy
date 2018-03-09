import XCTest
@testable import entropy

class TestSimulation:XCTestCase {
    private var simulation:Simulation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.simulation = Simulation()
    }
    
    func testLoadProject() {
        let expect:XCTestExpectation = expectation(description:"Wait for project to load")
        self.simulation?.loadProject {
            expect.fulfill()
        }
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.simulation?.project, "Error: project not loaded")
        }
    }
}
