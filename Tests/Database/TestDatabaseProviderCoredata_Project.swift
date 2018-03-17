import XCTest
import CoreData
@testable import entropy

class TestDatabaseProviderCoredata_Project:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    private var project:Project?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
        static let invalidIdentifier:String = "123"
    }
    
    override func setUp() {
        super.setUp()
        self.restartProvider()
    }
    
    private func restartProvider() {
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        self.provider = DatabaseProviderCoredata(bundle:bundle)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.provider, "Provider not loaded")
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.saveProjectAndWait(project:project)
        }
        self.waitExpectation()
    }
    
    private func saveProjectAndWait(project:Project) {
        self.provider?.save(project:project) { [weak self] in
            self?.expect?.fulfill()
        }
    }
    
    func testCreateProject() {
        self.startExpectation()
        self.waitToCreateProject()
        self.waitExpectation()
    }
    
    private func waitToCreateProject() {
        self.createProject { [weak self] (project:Project) in
            self?.project = project
            self?.expect?.fulfill()
        }
    }
    
    func testLoadProject() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.validateLoadingProject(createdProject:project)
        }
        self.waitExpectation()
    }
    
    func testLoadInvalidProject() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.validateLoadingInvalidProject()
        }
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Wait to create project")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func createProject(completion:@escaping((Project) -> ())) {
        self.provider?.createProject { (project:Project) in
            completion(project)
        }
    }
    
    private func validateLoadingProject(createdProject:Project) {
        self.loadProject(identifier:createdProject.identifier) { [weak self] (project:Project) in
            XCTAssertEqual(createdProject.identifier, project.identifier, "Project loaded is different")
            self?.expect?.fulfill()
        }
    }
    
    private func loadProject(identifier:String, completion:@escaping((Project) -> ())) {
        self.provider?.loadProject(identifier:identifier, found: { (project:Project) in
            completion(project)
        }, notFound: { [weak self] in
            XCTAssertNotNil(self?.project, "project wasn't loaded")
        })
    }
    
    private func validateLoadingInvalidProject() {
        self.provider?.loadProject(identifier:Constants.invalidIdentifier, found: { [weak self] (project:Project) in
            self?.project = project
            XCTAssertNil(self?.project, "Project should have not been found as it is invalid")
        }, notFound: { [weak self] in
            self?.expect?.fulfill()
        })
    }
    
    func testLoadProjectDifferentContext() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.restartProvider()
            self?.validateLoadingProject(createdProject:project)
        }
        self.waitExpectation()
    }
}
