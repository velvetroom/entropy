import XCTest
@testable import entropy

class TestSimulationViewContentCell:XCTestCase {
    private var cell:SimulationViewContentCell?
    private var viewModel:SimulationViewModelContentProjectName?
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCell()
        self.viewModel = SimulationViewModelContentProjectName()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create view cell")
        XCTAssertNotNil(self.viewModel, "Failed to create view model")
    }
    
    func testViewModel() {
        guard
            let viewModel:SimulationViewModelContentProjectName = self.viewModel
        else {
            return
        }
        self.cell?.update(viewModel:viewModel)
        XCTAssertNotNil(self.cell?.viewModel, "View model not being updated")
    }
}
