import XCTest
@testable import entropy

class TestSimulationViewModelMenuContributors:XCTestCase {
    private var item:SimulationViewModelMenuContributors?
    
    override func setUp() {
        super.setUp()
        self.item = SimulationViewModelMenuContributors()
    }
    
    func testViewModelContentIsNotEmpty() {
        XCTAssertNotNil(self.item, "Unable to load item")
        guard
            let viewModelContent:SimulationViewModelContent = self.item?.factoryViewModel()
        else {
            return
        }
        XCTAssertGreaterThan(viewModelContent.items.count, 0, "Error: Content is empty")
    }
}
