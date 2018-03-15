import XCTest
@testable import entropy

class TestSimulationViewContentCellProjectStartDate:XCTestCase {
    private var cell:SimulationViewContentCellProjectStartDate?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCellProjectStartDate()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to load cell")
    }
}
