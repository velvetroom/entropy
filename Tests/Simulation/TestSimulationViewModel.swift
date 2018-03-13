import XCTest
@testable import entropy

class TestSimulationViewModel:XCTestCase {
    private var viewModel:SimulationViewModel?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModel()
    }
}
