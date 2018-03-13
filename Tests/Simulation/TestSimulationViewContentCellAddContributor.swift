import XCTest
@testable import entropy

class TestSimulationViewContentCellAddContributor:XCTestCase {
    private var cell:SimulationViewContentCellAddContributor?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCellAddContributor()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create add contributor cell")
    }
}
