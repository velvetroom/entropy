import XCTest
@testable import entropy

class TestSimulationControllerScroll:XCTestCase {
    private var controller:SimulationControllerScroll?
    private var collectionView:UICollectionView?
    
    override func setUp() {
        super.setUp()
        self.controller = SimulationControllerScroll()
        self.collectionView = SimulationViewContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.controller, "Unable to load controller")
    }
    
    func testDequeueContentCell() {
        let cell:UICollectionViewCell? = self.tryDequeueContentCell()
        XCTAssertNotNil(cell, "Failed dequeuing content cell")
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
}
