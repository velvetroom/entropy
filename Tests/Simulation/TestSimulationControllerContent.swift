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
    
    func testDequeueCell() {
        let cell:UICollectionViewCell? = self.dequeueCellAtIndex(index:0)
        XCTAssertNotNil(cell, "Failed to dequeue collection cell")
    }
    
    func testDequeuedCellType() {
        guard
            let cell:UICollectionViewCell = self.dequeueCellAtIndex(index:0),
            let cellType:UICollectionViewCell.Type = self.cellTypeFor(index:0)
        else {
            return
        }
        let dequeuedCellType:UICollectionViewCell.Type = type(of:cell)
        XCTAssertTrue(cellType == dequeuedCellType, "Dequeued cell type is not the one needed")
    }
    
    private func dequeueCellAtIndex(index:Int) -> UICollectionViewCell? {
        guard
            let viewContent:SimulationViewContent = self.viewContent
        else {
            return nil
        }
        let index:IndexPath = IndexPath(item:index, section:0)
        let cell:UICollectionViewCell? = self.controller?.dequeueCell(collectionView:viewContent, index:index)
        return cell
    }
    
    private func cellTypeFor(index:Int) -> UICollectionViewCell.Type? {
        let cellType:UICollectionViewCell.Type? = self.viewModel?.content.items[index].cellType
        XCTAssertNotNil(cellType, "Unable to load cell type")
        return cellType
    }
}
