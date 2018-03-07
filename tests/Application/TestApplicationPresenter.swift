import XCTest
@testable import entropy

internal final class TestApplicationPresenter:XCTestCase {
    private weak var model:Model?
    private var presenter:ApplicationPresenter?
    private struct Constants {
        fileprivate static let expectationWait:TimeInterval = 2
        fileprivate static let modelWait:TimeInterval = 1
    }
    
    internal override func setUp() {
        super.setUp()
        self.presenter = ApplicationPresenter()
    }
    
    internal func testModelIsRetained() {
        self.presentNewModel()
        self.waitToPresentModel()
        self.validateModel()
    }
    
    private func presentNewModel() {
        let model:Model = Simulation()
        self.model = model
        self.presenter?.present(model:model, presentStrategy:PresentCentred.self)
    }
    
    private func waitToPresentModel() {
        let expect:XCTestExpectation = expectation(description:"Wait for model to be presented")
        let deadline:DispatchTime = DispatchTime.now() + Constants.modelWait
        DispatchQueue.main.asyncAfter(deadline:deadline) {
            expect.fulfill()
        }
    }
    
    private func validateModel() {
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.model, "Error: model got released")
        }
    }
}
