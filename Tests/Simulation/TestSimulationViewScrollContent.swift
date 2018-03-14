import XCTest
@testable import entropy

class TestSimulationViewScrollContent:XCTestCase {
    private var content:SimulationViewScrollContent?
    private struct Constants {
        static let newWidth:CGFloat = 100
        static let newHeight:CGFloat = 100
    }
    
    override func setUp() {
        super.setUp()
        self.content = SimulationViewScrollContent(frame:CGRect.zero)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.content, "Failed to init view content")
    }
    
    func testViewContent() {
        XCTAssertNotNil(self.content?.viewContent, "View doesn't contain content")
    }
}
