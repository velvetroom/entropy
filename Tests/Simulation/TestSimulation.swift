import XCTest
@testable import entropy

class TestSimulation:XCTestCase {
    private var simulation:Simulation?
    private var project:Project?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
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
        XCTAssertNotNil(self.simulation, "Failed to load simulation")
    }
    
    func testLoadProject() {
        let expect:XCTestExpectation = expectation(description:"Wait for project to load")
        self.simulation?.loadProject {
            expect.fulfill()
        }
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.simulation?.project, "Error: project not loaded")
        }
    }
    
    func testModelAssignedToController() {
        let controller:SimulationController? = self.simulation?.controller as? SimulationController
        XCTAssertNotNil(controller, "Controller doesn't match the type")
        XCTAssertNotNil(controller?.model, "Controller has not model assigned")
        XCTAssertNotNil(controller?.graph.model, "Graph controller doesn't have model assigned")
        XCTAssertNotNil(controller?.scroll.model, "Scroll controller doesn't have model assigned")
        XCTAssertNotNil(controller?.scroll.menu.model, "Menu controller doesn't have model assigned")
        XCTAssertNotNil(controller?.scroll.menu.content.model, "Content controller doesn't have model assigned")
        XCTAssertNotNil(controller?.scroll.menu.content.projectName.model,
                        "Project name controller doesn't have model assigned")
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
