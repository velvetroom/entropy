import XCTest
import CoreData
@testable import entropy

class TestDatabaseProviderCoredata:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    private var profileLoaded:Profile?
    private var project:Project?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
        static let projectIdentifier:String = "identifier"
        static let entropy:Float = 1
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        self.provider = DatabaseProviderCoredata(bundle:bundle)
        self.project = Project(identifier:Constants.projectIdentifier, entropy:Constants.entropy)
    }
    
    func testInitialisation() {
        XCTAssertNotNil(self.provider, "Provider not loaded")
        XCTAssertNotNil(self.project, "Project not loaded")
    }
    
    func testFactoryContext() {
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        let context:NSManagedObjectContext = DatabaseProviderCoredata.factoryContext(bundle:bundle)
        XCTAssertNotNil(context.persistentStoreCoordinator, "Failed to factory store coordinator")
    }
    
    func testCreateProfile() {
        self.waitToCreateProfile()
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.profileLoaded, "Error: profile not created")
        }
    }
    
    private func waitToCreateProfile() {
        let expect:XCTestExpectation = expectation(description:"Wait for profile to create")
        self.provider?.createProfile { [weak self] (profile:Profile) in
            self?.profileLoaded = profile
            expect.fulfill()
        }
    }
    
    func testLoadProfile() {
        self.waitToLoadProfile()
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNotNil(self?.profileLoaded, "Error: profile not loaded")
        }
    }
    
    private func waitToLoadProfile() {
        let expect:XCTestExpectation = expectation(description:"Wait for profile to load")
        self.provider?.createProfile { [weak self] (createdProfile:Profile) in
            self?.provider?.loadProfile(found: { [weak self] (profile:Profile) in
                self?.profileLoaded = profile
                expect.fulfill()
            }, notFound: {
                expect.fulfill()
            })
        }
    }
    
    func testLoadProfileNone() {
        self.waitToDeleteAllProfiles()
        waitForExpectations(timeout:Constants.expectationWait) { [weak self] (error:Error?) in
            XCTAssertNil(self?.profileLoaded, "Error: profile should not be found")
        }
    }
    
    private func waitToDeleteAllProfiles() {
        let expect:XCTestExpectation = expectation(description:"Wait for profile to load after delete all")
        self.provider?.deleteAll(entityType:CoredataProfile.self) { [weak self] in
            self?.provider?.loadProfile(found: { [weak self] (profile:Profile) in
                self?.profileLoaded = profile
                expect.fulfill()
            }, notFound: {
                expect.fulfill()
            })
        }
    }
    
    func testSaveProject() {
        self.saveProjectAndWait()
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func saveProjectAndWait() {
        let expect:XCTestExpectation = expectation(description:"Wait for profile to be saved")
        guard
            let project:Project = self.project
        else {
            return
        }
        self.provider?.save(project:project) {
            expect.fulfill()
        }
    }
}
