import XCTest
@testable import entropy

class TestSimulationViewContentCell:XCTestCase {
    private var cell:SimulationViewContentCell?
    private var viewModel:SimulationViewModelContentProjectName?
    private var controller:SimulationControllerContent?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCell()
        self.viewModel = SimulationViewModelContentProjectName()
        self.controller = SimulationControllerContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create view cell")
        XCTAssertNotNil(self.viewModel, "Failed to create view model")
        XCTAssertNotNil(self.controller, "Failed to load controller")
    }
    
    func testViewModel() {
        guard
            let viewModel:SimulationViewModelContentProjectName = self.viewModel,
            let controller:SimulationControllerContent = self.controller
        else {
            return
        }
        self.cell?.update(viewModel:viewModel, controller:controller)
        XCTAssertNotNil(self.cell?.viewModel, "View model not being updated")
    }
}
