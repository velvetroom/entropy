import XCTest
@testable import entropy

class TestSimulationViewModelContent:XCTestCase {
    private var content:SimulationViewModelContent?
    private var project:Project?
    private struct Constants {
        static let projectIdentifier:String = "project"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        let menuItem:SimulationViewModelMenuProject = SimulationViewModelMenuProject()
        self.content = menuItem.factoryViewModel()
        self.project = Project(identifier:Constants.projectIdentifier, entropy:Constants.entropy)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.content, "Failed to load content")
        XCTAssertNotNil(self.project, "Failed to load project")
    }
    
    func testContentProtocolHasCellType() {
        XCTAssertNotNil(self.content?.items.first?.cellType)
    }
    
    func testUpdateProject() {
        self.updatedContentWithProject()
        self.validateContentHasProject()
        self.validateContentItemsGetUpdated()
    }
    
    private func updatedContentWithProject() {
        guard
            let project:Project = self.project
        else {
            return
        }
        self.content?.update(project:project)
    }
    
    private func validateContentHasProject() {
        XCTAssertNotNil(self.content?.project, "Failed to save a reference to project")
    }
    
    private func validateContentItemsGetUpdated() {
        let items:[SimulationViewModelContentProtocol]? = self.content?.items
        XCTAssertNotNil(items, "Failed to load items")
        guard
            let contentItems:[SimulationViewModelContentProtocol] = items
        else {
            return
        }
        self.validateContentItemsWithProject(items:contentItems)
    }
    
    private func validateContentItemsWithProject(items:[SimulationViewModelContentProtocol]) {
        for item:SimulationViewModelContentProtocol in items {
            guard
                let itemWithProject:SimulationViewModelContentProjectProtocol = item as?
            SimulationViewModelContentProjectProtocol
            else {
                continue
            }
            XCTAssertNotNil(itemWithProject.project, "Failed to assign project to items")
        }
    }
}
