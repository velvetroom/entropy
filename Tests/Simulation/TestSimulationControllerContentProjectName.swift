import XCTest
@testable import entropy

class TestSimulationControllerContentProjectName:XCTestCase {
    private var controller:SimulationControllerContentProjectName?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationControllerContentProjectName()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "failed to load controller")
    }
}
