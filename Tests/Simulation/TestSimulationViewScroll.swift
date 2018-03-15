import XCTest
@testable import entropy

class TestSimulationViewScroll:XCTestCase {
    private var view:SimulationViewScroll?
    private var controller:SimulationControllerScroll?
    private var viewModel:SimulationViewModel?
    
    override func setUp() {
        super.setUp()
        self.view = SimulationViewScroll()
        self.controller = SimulationControllerScroll()
        self.viewModel = SimulationViewModel()
        self.view?.delegate = self.controller
        self.view?.dataSource = self.controller
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.view, "Unable to load view")
        XCTAssertNotNil(self.controller, "Unable to load controller")
        XCTAssertNotNil(self.viewModel, "Unable to load view model")
        XCTAssertNotNil(self.view?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.view?.dataSource, "Failed to assign data source")
    }
}
