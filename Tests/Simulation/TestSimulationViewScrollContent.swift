import XCTest
@testable import entropy

class TestSimulationViewScrollContent:XCTestCase {
    private var content:SimulationViewScrollContent?
    
    override func setUp() {
        super.setUp()
        self.content = SimulationViewScrollContent()
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.content, "Failed to init view content")
    }
    
    func testViewContent() {
        XCTAssertNotNil(self.content?.viewContent, "View doesn't contain content")
    }
    
    func testLayoutConstraints() {
        XCTAssertNotNil(self.content?.layoutContentTop, "Layout for content top not found")
        XCTAssertNotNil(self.content?.layoutContentBottom, "Layout for content bottom not found")
        XCTAssertNotNil(self.content?.layoutContentLeft, "Layout for content left not found")
    }
}
