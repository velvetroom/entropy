import XCTest
@testable import entropy

class TestCoredataProject:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
        static let fakeIdentifier:String = "fakeidentifier"
        static let fakeName:String = "fakeName"
        static let fakeEntropy:Float = 0.5
        static let fakeStartDate:Date = Date(timeIntervalSince1970:0)
        static let fakeCreatedDate:Date = Date(timeIntervalSince1970:0)
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
        self.createCoredataProject { [weak self] (coredataProject:CoredataProject) in
            self?.validateAwakeFromInsertWithProject(coredataProject:coredataProject)
        }
        self.waitExpectation()
    }
    
    func testFactoryProject() {
        self.startExpectation()
        self.createCoredataProject { [weak self] (coredataProject:CoredataProject) in
            self?.validateProjectFactory(coredataProject:coredataProject)
        }
        self.waitExpectation()
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
    
    private func validateProjectFactory(coredataProject:CoredataProject) {
        self.assignFakeValues(coredataProject:coredataProject)
        let factorisedProject:Project? = coredataProject.factoryProject()
        XCTAssertNotNil(factorisedProject, "Failed to factory project")
        guard
            let project:Project = factorisedProject
        else {
            return
        }
        self.validateFakeValues(project:project)
        self.expect?.fulfill()
    }
    
    private func assignFakeValues(coredataProject:CoredataProject) {
        coredataProject.identifier = Constants.fakeIdentifier
        coredataProject.name = Constants.fakeName
        coredataProject.entropy = Constants.fakeEntropy
        coredataProject.start = Constants.fakeStartDate
        coredataProject.created = Constants.fakeCreatedDate
    }
    
    private func validateFakeValues(project:Project) {
        XCTAssertEqual(project.identifier, Constants.fakeIdentifier)
        XCTAssertEqual(project.name, Constants.fakeName)
        XCTAssertEqual(project.entropy.index, Constants.fakeEntropy)
        XCTAssertEqual(project.start, Constants.fakeStartDate)
        XCTAssertEqual(project.created, Constants.fakeCreatedDate)
    }
}
