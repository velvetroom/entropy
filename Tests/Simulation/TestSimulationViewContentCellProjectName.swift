import XCTest
@testable import entropy

class TestSimulationViewContentCellProjectName:XCTestCase {
    private var cell:SimulationViewContentCellProjectName?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCellProjectName()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create project name cell")
    }
}
