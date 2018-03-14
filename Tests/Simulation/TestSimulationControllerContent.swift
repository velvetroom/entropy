import XCTest
@testable import entropy

class TestSimulationControllerContent:XCTestCase {
    private var controller:SimulationControllerContent?
    private var viewModel:SimulationViewModel?
    private var viewContent:SimulationViewContent?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModel()
        self.controller = SimulationControllerContent()
        self.viewContent = SimulationViewContent()
        self.controller?.viewContent = self.viewContent
        
        if let viewModel:SimulationViewModel = self.viewModel {
            self.controller?.reloadContent(viewModel:viewModel)
        }
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Unable to create controller")
    }
    
    func testControllerIsCollectionViewDelegate() {
        let delegate:UICollectionViewDelegate? = self.controller
        XCTAssertNotNil(delegate, "Controller doesn't conform to collection view delegate")
    }
    
    func testControllerIsCollectionViewDataSource() {
        let dataSource:UICollectionViewDataSource? = self.controller
        XCTAssertNotNil(dataSource, "Controller doesn't conform to collection view dataSource")
    }
    
    func testControllerIsFlowLayoutDelegate() {
        let flowLayoutDelegate:UICollectionViewDelegateFlowLayout? = self.controller
        XCTAssertNotNil(flowLayoutDelegate, "Controller doesn't conform to flow layout delegate")
    }
    
    func testNumberOfItems() {
        guard
            let viewContent:SimulationViewContent = self.controller?.viewContent
        else {
            XCTAssertNotNil(self.controller?.viewContent, "Unable to load view content")
            return
        }
        XCTAssertGreaterThan(viewContent.numberOfItems(inSection:0), 0, "No sections found on view model")
    }
}
