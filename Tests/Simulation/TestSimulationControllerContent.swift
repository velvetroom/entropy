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
        let delegate:UICollectionViewDelegate? = self.controller as? UICollectionViewDelegate
        XCTAssertNotNil(delegate, "Controller doesn't conform to collection view delegate")
    }
    
    func testControllerIsCollectionViewDatasource() {
        let dataSource:UICollectionViewDataSource? = self.controller as? UICollectionViewDataSource
        XCTAssertNotNil(dataSource, "Controller doesn't conform to collection view dataSource")
    }
}
