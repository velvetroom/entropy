import XCTest
@testable import entropy

class TestSimulationControllerMenu_ViewModel:XCTestCase {
    private var controller:SimulationController?
    private var menu:SimulationControllerMenu?
    private var viewModel:SimulationViewModel?
    private struct Constants {
        static let selectingIndex:Int = 1
    }
    
    override func setUp() {
        super.setUp()
        self.menu = SimulationControllerMenu()
        self.controller = SimulationController()
        self.viewModel = SimulationViewModel()
        self.controller?.viewModel = self.viewModel
        
        if let viewModel:SimulationViewModel = self.viewModel {
            self.menu?.reloadMenu(viewModel:viewModel.menu)
        }
    }
    
    func testViewModelUpdated() {
        self.selectMenuAtIndex(index:Constants.selectingIndex)
        self.validateIndexSelectedIsViewModel(index:Constants.selectingIndex)
    }
    
    private func selectMenuAtIndex(index:Int) {
        let indexPath:IndexPath = IndexPath(item:index, section:0)
        self.menu?.selectedItem(index:indexPath)
    }
    
    private func validateIndexSelectedIsViewModel(index:Int) {
        let menuItem:SimulationViewModelMenuProtocol? = self.viewModel?.menu.items[index]
        XCTAssertNotNil(menuItem, "Unable to load menu item")
        guard
            let item:SimulationViewModelMenuProtocol = menuItem,
            let viewModelContent:SimulationViewModelContent = self.viewModel?.content
        else {
            XCTAssertNotNil(self.viewModel, "Unable to load view model")
            return
        }
        let itemViewModel:SimulationViewModelContent = item.factoryViewModel()
        XCTAssertEqual(itemViewModel, viewModelContent, "Content view model not updated")
    }
}
