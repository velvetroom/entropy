import XCTest
@testable import entropy

class TestSimulationViewScrollContent:XCTestCase {
    private var viewContent:SimulationViewScrollContent?
    
    override func setUp() {
        super.setUp()
        self.viewContent = SimulationViewScrollContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.viewContent, "Failed to init view content")
    }
}
