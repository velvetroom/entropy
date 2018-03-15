import XCTest
@testable import entropy

class TestSimulationController:XCTestCase {
    private var controller:SimulationController?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationController()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testScrollDelegates() {
        self.loadView()
        XCTAssertNotNil(self.controller?.specialisedView?.viewScroll?.delegate, "Delegate not assigned")
        XCTAssertNotNil(self.controller?.specialisedView?.viewScroll?.dataSource, "DataSource not assigned")
    }
    
    private func loadView() {
        XCTAssertNotNil(self.controller?.view, "Failed loading view")
    }
}
