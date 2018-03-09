import XCTest
@testable import entropy

class TestDatabase:XCTestCase {
    private var database:Database?
    private var loadedProfile:Profile?
    private struct Constants {
        static let expectationWait:TimeInterval = 0.5
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        let provider:DatabaseProviderCoredata = DatabaseProviderCoredata(bundle:bundle)
        self.database = Database(provider:provider)
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
}
