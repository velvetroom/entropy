import Foundation

internal final class Database {
    internal let provider:DatabaseProviderProtocol
    
    internal init(provider:DatabaseProviderProtocol = DatabaseProviderCoredata()) {
        self.provider = provider
    }
    
    internal func loadProfile(completion:@escaping((Profile) -> ())) {
        self.provider.loadProfile(found:completion, notFound: { [weak self] in
            self?.provider.createProfile(completion:completion)
        })
    }
}
