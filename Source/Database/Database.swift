import Foundation

internal final class Database {
    internal let provider:DatabaseProviderProtocol
    
    internal init(provider:DatabaseProviderProtocol = DatabaseProviderCoredata()) {
        self.provider = provider
    }
    
    internal func loadProfile(completion:@escaping((Profile) -> ())) {
        
    }
}
