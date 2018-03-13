import XCTest
@testable import entropy

class TestSimulationViewContentCellAddLanguage:XCTestCase {
    private var cell:SimulationViewContentCellAddLanguage?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCellAddLanguage()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Unable to create cell")
    }
}
