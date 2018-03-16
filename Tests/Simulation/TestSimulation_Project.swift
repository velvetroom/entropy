import XCTest
@testable import entropy

class TestSimulation_Project:XCTestCase {
    private var simulation:Simulation?
    private var project:Project?
    private struct Constants {
        static let projectIdentifier:String = "project"
        static let projectInitialName:String = "initial"
        static let projectUpdatedName:String = "updated"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        self.simulation = Simulation()
        self.project = Project(identifier:Constants.projectIdentifier, entropy:Constants.entropy)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testUpdateProject() {
        self.updateProject()
        XCTAssertNotNil(self.simulation?.project, "Project is not being updated")
    }
    
    func testUpdateProjectName() {
        self.updateProject()
        self.assignInitialProjectName()
        self.updateProjectName()
    }
    
    private func updateProject() {
        guard
            let project:Project = self.project
        else {
            return
        }
        self.simulation?.update(project:project)
    }
    
    private func assignInitialProjectName() {
        self.project?.name = Constants.projectInitialName
    }
    
    private func updateProjectName() {
        self.simulation?.updateProject(name:Constants.projectUpdatedName)
    }
    
    private func validateNameIsUpdated() {
        guard
            let currentName:String = self.simulation?.project?.name
        else {
            return
        }
        XCTAssertEqual(currentName, Constants.projectUpdatedName, "Name is not being updated")
    }
}
