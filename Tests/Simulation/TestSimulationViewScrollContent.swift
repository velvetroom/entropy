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
        XCTAssertNotNil(self.content?.layoutContentRight, "Layout for content right not found")
    }
    
    func testUpdateLayout() {
        self.updateContentFrame()
        self.validateViewContentFrameIsUpdated()
    }
    
    private func updateContentFrame() {
        let newFrame:CGRect = CGRect(x:0, y:0, width:Constants.newWidth, height:Constants.newHeight)
        self.content?.frame = newFrame
    }
    
    private func validateViewContentFrameIsUpdated() {
        guard
            let viewContentFrame:CGRect = self.content?.viewContent?.frame
        else {
            XCTAssertNotNil(self.content?.viewContent, "Unable to find view content")
            return
        }
        XCTAssertEqual(viewContentFrame.width, Constants.newWidth, "Frame width wasn't updated")
        XCTAssertEqual(viewContentFrame.height, Constants.newHeight, "Frame height wasn't updated")
    }
}
