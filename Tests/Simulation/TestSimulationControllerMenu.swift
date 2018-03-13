import XCTest
@testable import entropy

class TestSimulationControllerMenu:XCTestCase {
    private var menu:SimulationControllerMenu?
    private struct Constants {
        static let selectedIndex:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.menu = SimulationControllerMenu()
    }
    
    func testDidSelectItem() {
        self.selectItem(index:Constants.selectedIndex)
        self.validateItemIsCurrent(index:Constants.selectedIndex)
    }
    
    private func selectItem(index:Int) {
        let index:IndexPath = IndexPath(item:index, section:0)
        self.menu?.selectedItem(index:index)
    }
    
    private func validateItemIsCurrent(index:Int) {
        guard
            let selectedItem:Int = self.menu?.viewModel.selected.item
        else {
            XCTAssertNotNil(self.menu, "Menu is not loaded")
            return
        }
        XCTAssertEqual(selectedItem, index, "Selected item is not being updated")
    }
}
