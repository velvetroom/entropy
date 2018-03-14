import XCTest
@testable import entropy

class TestSimulationControllerContent_ViewModel:XCTestCase {
    private var controller:SimulationController?
    private var content:SimulationControllerContent?
    private var viewModel:SimulationViewModel?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationController()
        self.content = SimulationControllerContent()
        self.viewModel = SimulationViewModel()
        self.controller?.viewModel = self.viewModel
    }
}
