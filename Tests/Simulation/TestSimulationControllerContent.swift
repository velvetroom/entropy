import XCTest
@testable import entropy

class TestSimulationControllerContent:XCTestCase {
    private var controller:SimulationControllerContent?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationControllerContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Unable to create controller")
    }
}
