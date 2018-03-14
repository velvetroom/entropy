import XCTest
@testable import entropy

class TestSimulationViewContent:XCTestCase {
    private var view:SimulationViewContent?
    
    override func setUp() {
        super.setUp()
        self.view = SimulationViewContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.view, "Unable to load view content")
    }
    
    func testFactoryLayout() {
        let layout:UICollectionViewFlowLayout? = SimulationViewContent.factoryLayout()
        XCTAssertNotNil(layout, "Failed to factory content layout")
    }
    
    
}
