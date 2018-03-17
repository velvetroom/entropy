import XCTest
@testable import entropy

class TestDatabase_Project:XCTestCase {
    private var database:Database?
    private var expect:XCTestExpectation?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
        static let updatedProjectName:String = "updated"
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        let provider:DatabaseProviderCoredata = DatabaseProviderCoredata(bundle:bundle)
        self.database = Database(provider:provider)
    }
    
    func testCreateProject() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.expect?.fulfill()
        }
        self.waitExpectation()
    }
    
    func testLoadProject() {
        self.startExpectation()
        self.createProject { [weak self] (project:Project) in
            self?.loadProject(identifier:project.identifier) { [weak self] (loadedProject:Project) in
                XCTAssertEqual(project.identifier, loadedProject.identifier, "Loaded project is different")
                self?.expect?.fulfill()
            }
        }
        self.waitExpectation()
    }
    
    func testSaveProject() {
        self.startExpectation()
        self.createAndEditProject { [weak self] (project:Project) in
            self?.saveProject(project:project) {
                self?.loadAndValidatedProjectIsUpdated(identifier:project.identifier) { [weak self] in
                    self?.expect?.fulfill()
                }
            }
        }
        self.waitExpectation()
    }
    
    private func createAndEditProject(completion:@escaping((Project) -> ())) {
        self.createProject { (project:Project) in
            project.name = Constants.updatedProjectName
            completion(project)
        }
    }
    
    private func createProject(completion:@escaping((Project) -> ())) {
        self.database?.createProject(completion:completion)
    }
    
    private func loadProject(identifier:String, completion:@escaping((Project) -> ())) {
        self.database?.loadProject(identifier:identifier, found:completion)
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func saveProject(project:Project, completion:@escaping(() -> ())) {
        self.database?.save(project:project, completion:completion)
    }
    
    private func loadAndValidatedProjectIsUpdated(identifier:String, completion:@escaping(() -> ())) {
        self.loadProject(identifier:identifier) { (project:Project) in
            XCTAssertEqual(project.name, Constants.updatedProjectName, "Project loaded is not updated")
            completion()
        }
    }
}
