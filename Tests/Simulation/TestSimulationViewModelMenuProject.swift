import XCTest
@testable import entropy

class TestSimulationViewModelMenuProject:XCTestCase {
    private var item:SimulationViewModelMenuProject?
    
    override func setUp() {
        super.setUp()
        self.item = SimulationViewModelMenuProject()
    }
    
    func testViewModelContentIsNotEmpty() {
        XCTAssertNotNil(self.item, "Unable to load item")
        guard
            let viewModelContent:SimulationViewModelContent = self.item?.factoryViewModel()
        else {
            return
        }
        XCTAssertGreaterThan(viewModelContent.items.count, 0, "Content is empty")
    }
}
