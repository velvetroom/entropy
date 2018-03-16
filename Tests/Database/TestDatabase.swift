import XCTest
@testable import entropy

class TestDatabase:XCTestCase {
    private var database:Database?
    private var project:Project?
    private var loadedProfile:Profile?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
        static let projectIdentifier:String = "identifier"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        let provider:DatabaseProviderCoredata = DatabaseProviderCoredata(bundle:bundle)
        self.database = Database(provider:provider)
        self.project = Project(identifier:Constants.projectIdentifier, entropy:Constants.entropy)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.database, "Unable to load database")
        XCTAssertNotNil(self.project, "Unable to load project")
    }
    
    func testLoadProfile() {
        self.waitForProfileToLoad()
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.loadedProfile, "Error: profile not loaded")
        }
    }
    
    private func waitForProfileToLoad() {
        let expect:XCTestExpectation = expectation(description:"Wait for profile to load")
        self.database?.loadProfile { [weak self] (profile:Profile) in
            self?.loadedProfile = profile
            expect.fulfill()
        }
    }
    
    func testSaveProject() {
        let expect:XCTestExpectation = expectation(description:"Waiting for profile to save")
        self.saveProject {
            expect.fulfill()
        }
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func saveProject(completion:@escaping(() -> ())) {
        guard
            let project:Project = self.project
        else {
            return
        }
        self.database?.save(project:project, completion:completion)
    }
}
