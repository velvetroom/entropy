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
    
    func testMergeProfile() {
        self.startExpectation()
        self.createCoredataProject { [weak self] (coredataProject:CoredataProject) in
            self?.mergeWithProject(coredataProject:coredataProject)
            self?.validateMergeSuccess(coredataProject:coredataProject)
            self?.expect?.fulfill()
        }
        self.waitExpectation()
    }
    
    func testMergeFakeProfile() {
        self.startExpectation()
        self.createCoredataProject { [weak self] (coredataProject:CoredataProject) in
            self?.fakeProjectMergeWithProject(coredataProject:coredataProject)
            self?.validateMergeFailed(coredataProject:coredataProject)
            self?.expect?.fulfill()
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
        self.provider?.createCoredataProject(completion:completion)
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
    
    private func factoryProjectWithIdentifier(identifier:String) -> Project {
        let project:Project = Project(identifier:identifier, entropy:Constants.fakeEntropy)
        project.created = Constants.fakeCreatedDate
        project.start = Constants.fakeStartDate
        project.name = Constants.fakeName
        return project
    }
    
    private func mergeWithProject(coredataProject:CoredataProject) {
        guard
            let identifier:String = coredataProject.identifier
        else {
            XCTAssertNotNil(coredataProject.identifier, "Project has no identifier")
            return
        }
        let project:Project = self.factoryProjectWithIdentifier(identifier:identifier)
        coredataProject.merge(project:project)
    }
    
    private func fakeProjectMergeWithProject(coredataProject:CoredataProject) {
        let project:Project = self.factoryProjectWithIdentifier(identifier:Constants.fakeIdentifier)
        coredataProject.merge(project:project)
    }
    
    private func validateMergeSuccess(coredataProject:CoredataProject) {
        XCTAssertEqual(coredataProject.name, Constants.fakeName, "Name not modified")
        XCTAssertEqual(coredataProject.entropy, Constants.fakeEntropy, "Entropy not modified")
        XCTAssertEqual(coredataProject.start, Constants.fakeStartDate, "Start date not modified")
        XCTAssertNotEqual(coredataProject.created, Constants.fakeCreatedDate, "Created should not be modified")
    }
    
    private func validateMergeFailed(coredataProject:CoredataProject) {
        XCTAssertNotEqual(coredataProject.identifier, Constants.fakeIdentifier, "Identifier should not modified")
        XCTAssertNotEqual(coredataProject.name, Constants.fakeName, "Name should not modified")
        XCTAssertNotEqual(coredataProject.entropy, Constants.fakeEntropy, "Entropy should not modified")
        XCTAssertNotEqual(coredataProject.start, Constants.fakeStartDate, "Start date should not modified")
        XCTAssertNotEqual(coredataProject.created, Constants.fakeCreatedDate, "Created should not be modified")
    }
}
