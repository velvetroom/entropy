import XCTest
@testable import entropy

class TestSimulationViewModel:XCTestCase {
    private var project:Project?
    private var viewModel:SimulationViewModel?
    private struct Constants {
        static let identifier:String = "project"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        self.project = Project(identifier:Constants.identifier, entropy:Constants.entropy)
        self.viewModel = SimulationViewModel()
    }
    
    func testViewModelInstantiated() {
        XCTAssertNotNil(self.viewModel, "Failed creating view model")
    }
    
    func testProjectInstantiated() {
        XCTAssertNotNil(self.project, "Project doesn't get instantiated")
    }
    
    func testMenuReturnsSelectedItem() {
        XCTAssertNotNil(self.viewModel?.menu.selectedItem, "Failed to return selected item")
    }
    
    func testMenuItemsNotZero() {
        guard
            let countItems:Int = self.viewModel?.menu.items.count
        else {
            return
        }
        XCTAssertGreaterThan(countItems, 0, "Error: Empty menu items")
    }
    
    func testUpdateProject() {
        self.updateProject()
        self.validateMenuItemsHaveProject()
    }
    
    func testUpdateContentProject() {
        self.updateProject()
        self.validateContentItemsHaveProject()
    }
    
    private func updateProject() {
        guard
            let project:Project = self.project
        else {
            return
        }
        self.viewModel?.update(project:project)
    }
    
    private func validateMenuItemsHaveProject() {
        guard
            let items:[SimulationViewModelMenuProtocol] = self.viewModel?.menu.items
        else {
            return
        }
        for item:SimulationViewModelMenuProtocol in items {
            XCTAssertNotNil(item.project, "Item doesn't have a reference to project")
        }
    }
    
    private func validateContentItemsHaveProject() {
        let items:[SimulationViewModelContentProtocol]? = self.viewModel?.content.items
        XCTAssertNotNil(items, "Failed to load content items")
        guard
            let contentItems:[SimulationViewModelContentProtocol] = items
        else {
            return
        }
        self.compareContentWithProject(items:contentItems)
    }
    
    private func compareContentWithProject(items:[SimulationViewModelContentProtocol]) {
        for item:SimulationViewModelContentProtocol in items {
            guard
                let itemWithProject:SimulationViewModelContentProjectProtocol = item as?
            SimulationViewModelContentProjectProtocol
            else {
                continue
            }
            XCTAssertNotNil(itemWithProject.project, "Item is not being updated with project")
        }
    }
}
