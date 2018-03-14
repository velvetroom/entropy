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
    
    func testControllerIsCollectionViewDelegate() {
        let delegate:UICollectionViewDelegate? = self.controller
        XCTAssertNotNil(delegate, "Controller doesn't conform to collection view delegate")
    }
    
    func testControllerIsCollectionViewDataSource() {
        let dataSource:UICollectionViewDataSource? = self.controller
        XCTAssertNotNil(dataSource, "Controller doesn't conform to collection view dataSource")
    }
    
    func testControllerIsFlowLayoutDelegate() {
        let flowLayoutDelegate:UICollectionViewDelegateFlowLayout? = self.controller
        XCTAssertNotNil(flowLayoutDelegate, "Controller doesn't conform to flow layout delegate")
    }
}
