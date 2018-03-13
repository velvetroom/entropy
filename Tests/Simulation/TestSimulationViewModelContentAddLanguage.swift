import XCTest
@testable import entropy

class TestSimulationViewModelContentAddLanguage:XCTestCase {
    private var viewModel:SimulationViewModelContentAddLanguage?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModelContentAddLanguage()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.viewModel, "Failed to create view model")
    }
}
