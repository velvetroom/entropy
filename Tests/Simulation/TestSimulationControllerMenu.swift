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
    
    func testIsScrollableToItem() {
        let scrollable:Bool? = self.menu?.isScrollableToIndex(index:Constants.selectedIndex)
        XCTAssertNotNil(scrollable, "Unable to validate if menu is scrollable")
        guard
            let isScrollable:Bool = scrollable
        else {
            return
        }
        XCTAssertFalse(isScrollable, "Menu should not be scrollable when there are not items")
    }
}
