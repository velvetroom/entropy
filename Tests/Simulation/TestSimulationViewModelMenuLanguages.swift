import XCTest
@testable import entropy

class TestSimulationViewModelMenuLanguages:XCTestCase {
    private var item:SimulationViewModelMenuLanguages?
    
    override func setUp() {
        super.setUp()
        self.item = SimulationViewModelMenuLanguages()
    }
    
    func testViewModelContentIsNotEmpty() {
        XCTAssertNotNil(self.item, "Unable to load item")
        guard
            let viewModelContent:SimulationViewModelContent = self.item?.factoryViewModel()
        else {
            return
        }
        XCTAssertGreaterThan(0, viewModelContent.items.count, "Content is empty")
    }
}
