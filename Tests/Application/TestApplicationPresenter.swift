import XCTest
@testable import entropy

class TestApplicationPresenter:XCTestCase {
    private weak var presentedModel:Model?
    private weak var presentedController:AbstractController?
    private var presenter:ApplicationPresenter?
    private var controller:ApplicationController?
    private struct Constants {
        static let expectationWait:TimeInterval = 1
        static let modelWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        self.controller = ApplicationController()
        self.presenter = ApplicationPresenter()
        self.presenter?.controller = self.controller
    }
    
    func testModelIsRetained() {
        self.presentNewModel()
        self.waitToPresentModel()
        self.validateModelIsRetained()
    }
    
    private func presentNewModel() {
        let model:Model = Simulation()
        self.presentedModel = model
        self.presentedController = model.controller
        self.presenter?.present(model:model, presentStrategy:PresentCentred.self)
    }
    
    private func waitToPresentModel() {
        let expect:XCTestExpectation = expectation(description:"Wait for model to be presented")
        let deadline:DispatchTime = DispatchTime.now() + Constants.modelWait
        DispatchQueue.main.asyncAfter(deadline:deadline) {
            expect.fulfill()
        }
    }
    
    private func validateModelIsRetained() {
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.presentedModel, "Error: model got released")
        }
    }
    
    func testPresentedControllerIsOnTop() {
        self.presentNewModel()
        self.waitToPresentModel()
        self.validateControllerIsOnTop()
    }
    
    private func validateControllerIsOnTop() {
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.presentedController, "Error: controller is nil")
            XCTAssertEqual(self?.presenter?.controller?.childViewControllers.last, self?.presentedController,
                           "Error: presented controller is not on top")
        }
    }
}
