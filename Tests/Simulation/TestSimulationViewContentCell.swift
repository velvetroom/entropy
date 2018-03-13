import XCTest
@testable import entropy

class TestSimulationViewContentCell:XCTestCase {
    private var cell:SimulationViewContentCell?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCell()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create view cell")
    }
}
