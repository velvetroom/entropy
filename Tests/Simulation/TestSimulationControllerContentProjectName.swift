import XCTest
@testable import entropy

class TestSimulationControllerContentProjectName:XCTestCase {
    private var model:Simulation?
    private var project:Project?
    private weak var controller:SimulationControllerContentProjectName?
    private struct Constants {
        static let projectIdentifier:String = "project"
        static let entropy:Float = 1
        static let projectInitialName:String = "initialName"
        static let projectUpdatedName:String = "updatedName"
    }
    
    override func setUp() {
        super.setUp()
        self.model = Simulation()
        self.project = Project(identifier:Constants.projectIdentifier, entropy:Constants.entropy)
        self.project?.name = Constants.projectInitialName
        
        if let project:Project = self.project {
            self.model?.update(project:project)
        }
        
        if let controller:SimulationController = self.model?.controller as? SimulationController {
            self.controller = controller.scroll.menu.content.projectName
        }
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "failed to load controller")
    }
    
    func testUpdatingName() {
        self.validateProjectNameIs(name:Constants.projectInitialName)
        self.updateNameInController()
        self.validateProjectNameIs(name:Constants.projectUpdatedName)
    }
    
    private func validateProjectNameIs(name:String) {
        let currentName:String? = self.model?.project?.name
        XCTAssertNotNil(currentName, "Unable to load project name")
        guard
            let projectName:String = currentName
        else {
            return
        }
        XCTAssertEqual(projectName, name, "Current name doesn't match expected name")
    }
    
    private func updateNameInController() {
        self.controller?.update(name:Constants.projectUpdatedName)
    }
}
