import XCTest
@testable import entropy

class TestDatabaseProviderCoredata:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    private var profileLoaded:Profile?
    private struct Constants {
        static let expectationWait:TimeInterval = 1
    }
    
    override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        self.provider = DatabaseProviderCoredata(bundle:bundle)
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
        self.provider?.loadProfile(found: { [weak self] (profile:Profile) in
            self?.profileLoaded = profile
            expect.fulfill()
        }, notFound: {
            expect.fulfill()
        })
    }
}
