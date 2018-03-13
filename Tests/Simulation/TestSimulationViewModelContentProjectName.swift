import XCTest
@testable import entropy

class TestSimulationViewModelContentProjectName:XCTestCase {
    private var viewModel:SimulationViewModelContentProjectName?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModelContentProjectName()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.viewModel, "Unable to load view model")
    }
}
