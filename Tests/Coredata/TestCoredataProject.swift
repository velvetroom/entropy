import XCTest
@testable import entropy

class TestCoredataProject:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        self.provider = DatabaseProviderCoredata(bundle:bundle)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.provider, "Provider not loaded")
    }
    
    func testAwakeFromInsert() {
        self.startExpectation()
        self.createCoredataProject { (coredataProject:CoredataProject) in
            self.validateAwakeFromInsertWithProject(coredataProject:coredataProject)
        }
        self.waitExpectation()
    }
    
    func testFactoryProject() {
        
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func createCoredataProject(completion:@escaping((CoredataProject) -> ())) {
        self.provider?.createCoredataProject { (coredataProject:CoredataProject) in
            completion(coredataProject)
        }
    }
    
    private func validateAwakeFromInsertWithProject(coredataProject:CoredataProject) {
        XCTAssertNotNil(coredataProject.identifier, "Failed to assign identifier")
        XCTAssertNotNil(coredataProject.created, "Failed to assign created date")
        XCTAssertNotNil(coredataProject.start, "Failed to assign start date")
        XCTAssertNotNil(coredataProject.name, "Failed to assign project name")
        self.expect?.fulfill()
    }
}
