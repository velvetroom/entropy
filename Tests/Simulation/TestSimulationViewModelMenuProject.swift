import XCTest
@testable import entropy

class TestSimulationViewModelMenuProject:XCTestCase {
    private var item:SimulationViewModelMenuProject?
    private var project:Project?
    private struct Constants {
        static let identifier:String = "project"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        self.item = SimulationViewModelMenuProject()
        self.project = Project(identifier:Constants.identifier, entropy:Constants.entropy)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.item, "Failed creating item")
        XCTAssertNotNil(self.project, "Failed creating project")
    }
    
    func testViewModelContentIsNotEmpty() {
        XCTAssertNotNil(self.item, "Unable to load item")
        guard
            let viewModelContent:SimulationViewModelContent = self.item?.factoryViewModel()
        else {
            return
        }
        XCTAssertGreaterThan(viewModelContent.items.count, 0, "Content is empty")
    }
    
    func testUpdateProject() {
        self.updateProject()
    }
    
    private func updateProject() {
        guard
            let project:Project = self.project
        else {
            return
        }
        self.item?.update(project:project)
    }
    
    private func validateProjectNameHasProject() {
        let content:SimulationViewModelContent? = self.item?.factoryViewModel()
        let firstItem:SimulationViewModelContentProtocol? = content?.items.first
        let projectName:SimulationViewModelContentProjectName? = firstItem as? SimulationViewModelContentProjectName
        XCTAssertNotNil(projectName, "Project name is not the first item")
        XCTAssertNotNil(projectName?.project, "Project name doesn't contain project")
    }
}
