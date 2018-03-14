import XCTest
@testable import entropy

class TestSimulationControllerScroll:XCTestCase {
    private var controller:SimulationControllerScroll?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationControllerScroll()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Unable to load controller")
    }
}
