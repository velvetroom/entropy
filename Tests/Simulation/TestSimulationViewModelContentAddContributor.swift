import XCTest
@testable import entropy

class TestSimulationViewModelContentAddContributor:XCTestCase {
    private var viewModel:SimulationViewModelContentAddContributor?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModelContentAddContributor()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.viewModel, "Failed to create view model")
    }
}
