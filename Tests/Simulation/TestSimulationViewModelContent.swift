import XCTest
@testable import entropy

class TestSimulationViewModelContent:XCTestCase {
    private var content:SimulationViewModelContent?
    
    override func setUp() {
        super.setUp()
        let menuItem:SimulationViewModelMenuProject = SimulationViewModelMenuProject()
        self.content = menuItem.factoryViewModel()
    }
    
    func testContentProtocolHasCellType() {
        XCTAssertNotNil(self.content?.items.first.cellType)
    }
}
