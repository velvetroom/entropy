import XCTest
@testable import entropy

class TestSimulationViewModelContentProjectStartDate:XCTestCase {
    private var viewModel:SimulationViewModelContentProjectStartDate?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModelContentProjectStartDate()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.viewModel, "Failed to load view model")
    }
}
