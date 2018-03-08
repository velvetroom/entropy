import XCTest
@testable import entropy

internal class TestDatabaseProviderCoredata:XCTestCase {
    private var provider:DatabaseProviderCoredata?
    
    internal override func setUp() {
        super.setUp()
        let bundle:Bundle = Bundle(for:TestDatabaseProviderCoredata.self)
        self.provider = DatabaseProviderCoredata(bundle:bundle)
    }
}
