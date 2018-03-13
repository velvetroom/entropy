import XCTest
@testable import entropy

class TestSimulationControllerMenu:XCTestCase {
    private var menu:SimulationControllerMenu?
    private struct Constants {
        static let selectedIndex:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        let viewMenu:SimulationViewMenu = SimulationViewMenu()
        self.menu = SimulationControllerMenu()
        self.menu?.viewMenu = viewMenu
    }
    
    func testDidSelectItem() {
        self.selectItem(index:Constants.selectedIndex)
        self.validateItemIsCurrent(index:Constants.selectedIndex)
        self.validateCollectionIsUpdated(index:Constants.selectedIndex)
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
    
    private func validateCollectionIsUpdated(index:Int) {
        let viewMenuItem:Int? = self.menu?.viewMenu?.indexPathsForSelectedItems?.first?.item
        XCTAssertNotNil(viewMenuItem, "Unable to load selected item")
        guard
            let selectedItem:Int = viewMenuItem
        else {
            return
        }
        XCTAssertEqual(selectedItem, index, "View selected item is not being updated")
    }
    
    func testIsScrollableToItem() {
        self.menu?.isScrollableToIndex(index:Constants.selectedIndex)
    }
}
