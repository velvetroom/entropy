import XCTest
@testable import entropy

class TestSimulationViewModel:XCTestCase {
    private var viewModel:SimulationViewModel?
    
    override func setUp() {
        super.setUp()
        self.viewModel = SimulationViewModel()
    }
    
    func testViewModelInstantiated() {
        XCTAssertNotNil(self.viewModel, "Failed creating view model")
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
}
