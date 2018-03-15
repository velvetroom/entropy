import XCTest
@testable import entropy

class TestSimulationViewScroll:XCTestCase {
    private var view:SimulationViewScroll?
    private var controller:SimulationControllerScroll?
    private var viewModel:SimulationViewModel?

    override func setUp() {
        super.setUp()
        self.view = SimulationViewScroll()
        self.controller = SimulationControllerScroll()
        self.viewModel = SimulationViewModel()
        self.view?.delegate = self.controller
        self.view?.dataSource = self.controller
        
        if let viewModel:SimulationViewModel = self.viewModel {
            self.controller?.menu.reloadMenu(viewModel:viewModel)
        }
        
        if let view:SimulationViewScroll = self.view {
            self.controller?.update(viewScroll:view)
        }
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.view, "Unable to load view")
        XCTAssertNotNil(self.controller, "Unable to load controller")
        XCTAssertNotNil(self.viewModel, "Unable to load view model")
        XCTAssertNotNil(self.view?.delegate, "Failed to assign delegate")
        XCTAssertNotNil(self.view?.dataSource, "Failed to assign data source")
        XCTAssertNotNil(self.controller?.menu.viewModel, "Failed to assign view model")
        XCTAssertNotNil(self.controller?.menu.viewScroll, "Failed to assign view scroll")
    }
    
    func testUpdateContentHeight() {
        self.assignProjectContent()
        let initialHeight:CGFloat = self.getContentHeight()
        XCTAssertGreaterThan(initialHeight, 0, "Failed to get initial height")
        
        self.assignContributorsContent()
        let updatedHeight:CGFloat = self.getContentHeight()
        XCTAssertNotEqual(initialHeight, updatedHeight, "Failed to update height")
    }
    
    private func assignProjectContent() {
        let item:SimulationViewModelMenuProject = SimulationViewModelMenuProject()
        self.viewModel?.content = item.factoryViewModel()
    }
    
    private func assignContributorsContent() {
        let item:SimulationViewModelMenuContributors = SimulationViewModelMenuContributors()
        self.viewModel?.content = item.factoryViewModel()
    }
    
    private func getContentHeight() -> CGFloat {
        let index:IndexPath = IndexPath(item:1, section:0)
        guard
            let controller:SimulationControllerScroll = self.controller,
            let view:SimulationViewScroll = self.view
        else {
            return 0
        }
        let size:CGSize = controller.collectionView(view, layout:view.collectionViewLayout, sizeForItemAt:index)
        return size.height
    }
}
