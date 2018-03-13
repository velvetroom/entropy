import XCTest
@testable import entropy

class TestSimulationControllerMenu:XCTestCase {
    private var menu:SimulationControllerMenu?
    override func setUp() {
        super.setUp()
        self.menu = SimulationControllerMenu()
    }
    
    func testDidSelectItem() {
        let index:IndexPath = IndexPath(item:1, section:0)
        self.menu?.selectedItem(index:index)
    }
}
