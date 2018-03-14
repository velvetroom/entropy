import XCTest
@testable import entropy

class TestSimulationViewContentCellProjectName:XCTestCase {
    private var cell:SimulationViewContentCellProjectName?
    private var viewModel:SimulationViewModelContentProjectName?
    private var project:Project?
    private struct Constants {
        static let identifier:String = "project"
        static let entropy:Float = 1
        static let projectName:String = "test"
    }
    
    override func setUp() {
        super.setUp()
        self.cell = SimulationViewContentCellProjectName()
        self.viewModel = SimulationViewModelContentProjectName()
        self.project = Project(identifier:Constants.identifier, entropy:Constants.entropy)
        self.project?.name = Constants.projectName
        self.viewModel?.project = self.project
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.cell, "Failed to create project name cell")
        XCTAssertNotNil(self.viewModel, "Failed to create view model")
        XCTAssertNotNil(self.project, "Failed to create project")
    }
    
    func testUpdateProject() {
        self.updateViewModel()
        self.validateProjectNameUpdated()
    }
    
    private func updateViewModel() {
        guard
            let viewModel:SimulationViewModelContentProjectName = self.viewModel
        else {
            return
        }
        self.cell?.update(viewModel:viewModel)
    }
    
    private func validateProjectNameUpdated() {
        let projectName:String? = self.cell?.viewField?.text
        XCTAssertNotNil(projectName, "No project name found")
        guard
            let name:String = projectName
        else {
            return
        }
        XCTAssertEqual(name, Constants.projectName, "Project name is not being updated")
    }
}
