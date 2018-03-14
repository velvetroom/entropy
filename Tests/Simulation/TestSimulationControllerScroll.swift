import XCTest
@testable import entropy

class TestSimulationControllerScroll:XCTestCase {
    private var controller:SimulationControllerScroll?
    private var collectionView:UICollectionView?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationControllerScroll()
        self.collectionView = SimulationViewScroll()
        self.collectionView?.delegate = self.controller
        self.collectionView?.dataSource = self.controller
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Unable to load controller")
    }
    
    func testMenuController() {
        XCTAssertNotNil(self.controller?.menu, "Controller doesn't have a reference to menu")
    }
    
    func testContentController() {
        XCTAssertNotNil(self.controller?.content, "Controller doesn't have a reference to content")
    }
    
    func testDequeueMenuCell() {
        let cell:UICollectionViewCell? = self.tryDequeueMenuCell()
        XCTAssertNotNil(cell, "Failed dequeuing menu cell")
        guard
            let dequeuedCell:UICollectionViewCell = cell
        else {
            return
        }
        self.validateCellIsMenu(cell:dequeuedCell)
    }
    
    private func tryDequeueMenuCell() -> UICollectionViewCell? {
        guard
            let collectionView:UICollectionView = self.collectionView
        else {
            XCTAssertNotNil(self.collectionView, "Unable to load collectionView")
           return nil
        }
        let index:IndexPath = IndexPath(item:0, section:0)
        return self.controller?.dequeueMenuCell(collectionView:collectionView, index:index)
    }
    
    private func validateCellIsMenu(cell:UICollectionViewCell) {
        let menuCell:SimulationViewScrollMenu? = cell as? SimulationViewScrollMenu
        XCTAssertNotNil(menuCell, "Dequeued cell is not menu cell")
        XCTAssertNotNil(menuCell?.viewMenu, "Menu cell doesn't contain view menu")
    }
    
    func testDequeueContentCell() {
        let cell:UICollectionViewCell? = self.tryDequeueContentCell()
        XCTAssertNotNil(cell, "Failed dequeuing content cell")
        guard
            let dequeueCell:UICollectionViewCell = cell
        else {
            return
        }
        self.validateCellIsContent(cell:dequeueCell)
    }
    
    private func tryDequeueContentCell() -> UICollectionViewCell? {
        guard
            let collectionView:UICollectionView = self.collectionView
        else {
            XCTAssertNotNil(self.collectionView, "Unable to load collectionView")
            return nil
        }
        let index:IndexPath = IndexPath(item:0, section:0)
        return self.controller?.dequeueContentCell(collectionView:collectionView, index:index)
    }
    
    private func validateCellIsContent(cell:UICollectionViewCell) {
        let contentCell:SimulationViewScrollContent? = cell as? SimulationViewScrollContent
        XCTAssertNotNil(contentCell, "Dequeue cell is not content cell")
        XCTAssertNotNil(contentCell?.viewContent, "Content cell doesn't contain view content")
    }
}
