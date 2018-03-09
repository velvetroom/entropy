import Foundation

class Database {
    let provider:DatabaseProviderProtocol
    
    init(provider:DatabaseProviderProtocol = DatabaseProviderCoredata()) {
        self.provider = provider
    }
    
    func loadProfile(completion:@escaping((Profile) -> ())) {
        self.provider.loadProfile(found:completion, notFound: { [weak self] in
            self?.provider.createProfile(completion:completion)
        })
    }
}
