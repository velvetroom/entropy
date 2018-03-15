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
        self.validateProjectNameHasProject()
    }
    
    func testUpdateProjectAfterFactory() {
        let content:SimulationViewModelContent? = self.item?.factoryViewModel()
        XCTAssertNotNil(content, "Unable to load content")
        guard
            let viewModelContent:SimulationViewModelContent = content
        else {
            return
        }
        self.updateProject()
        self.validateContentWithProjectProtocol(content:viewModelContent)
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
        XCTAssertNotNil(content, "Failed to load content")
        guard
            let viewModelContent:SimulationViewModelContent = content
        else {
            return
        }
        self.validateContentWithProjectProtocol(content:viewModelContent)
    }
    
    private func validateContentWithProjectProtocol(content:SimulationViewModelContent) {
        for item:SimulationViewModelContentProtocol in content.items {
            guard
                let itemWithProject:SimulationViewModelContentProjectProtocol = item as?
            SimulationViewModelContentProjectProtocol
                else {
                continue
            }
            XCTAssertNotNil(itemWithProject.project, "Item should have a reference to project")
        }
    }
}
