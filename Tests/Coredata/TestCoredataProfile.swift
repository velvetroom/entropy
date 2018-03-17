import XCTest
@testable import entropy

class TestCoredataProfile:XCTestCase {
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
        self.createCoredataProfile { [weak self] (coredataProfile:CoredataProfile) in
            self?.validateAwakeFromInsertWithProfile(coredataProfile:coredataProfile)
        }
        self.waitExpectation()
    }
    
    func testFactoryProfileWithoutProject() {
        self.startExpectation()
        self.createCoredataProfile { [weak self] (coredataProfile:CoredataProfile) in
            self?.validateProfileFactoryWithoutProject(coredataProfile:coredataProfile)
        }
        self.waitExpectation()
    }
    
    func testFactoryProfile() {
        self.startExpectation()
        self.createCoredataProfile { [weak self] (coredataProfile:CoredataProfile) in
            self?.createCoredataProject { [weak self] (coredataProject:CoredataProject) in
                self?.createCoredataAccess { [weak self] (coredataAccess:CoredataProfileAccessFree) in
                    coredataProfile.project = coredataProject
                    coredataProfile.access = coredataAccess
                    self?.validateProfileFactory(coredataProfile:coredataProfile)
                }
            }
        }
        self.waitExpectation()
    }
    
    private func startExpectation() {
        self.expect = expectation(description:"Waiting for expectation")
    }
    
    private func waitExpectation() {
        waitForExpectations(timeout:Constants.expectationWait) { (error:Error?) in }
    }
    
    private func createCoredataProfile(completion:@escaping((CoredataProfile) -> ())) {
        self.provider?.createCoredataProfile(completion:completion)
    }
    
    private func createCoredataProject(completion:@escaping((CoredataProject) -> ())) {
        self.provider?.createCoredataProject(completion:completion)
    }
    
    private func createCoredataAccess(completion:@escaping((CoredataProfileAccessFree) -> ())) {
        self.provider?.createFreeAccess(completion:completion)
    }
    
    private func validateAwakeFromInsertWithProfile(coredataProfile:CoredataProfile) {
        self.expect?.fulfill()
    }
    
    private func validateProfileFactoryWithoutProject(coredataProfile:CoredataProfile) {
        let factorisedProfile:Profile? = coredataProfile.factoryProfile()
        XCTAssertNil(factorisedProfile, "Profile without project should fail to factory")
        self.expect?.fulfill()
    }
    
    private func validateProfileFactory(coredataProfile:CoredataProfile) {
        let factorisedProfile:Profile? = coredataProfile.factoryProfile()
        XCTAssertNotNil(factorisedProfile, "Failed to factory profile")
        self.expect?.fulfill()
    }
}
