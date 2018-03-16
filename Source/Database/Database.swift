import Foundation

class Database {
    let provider:DatabaseProviderProtocol
    
    init(provider:DatabaseProviderProtocol = DatabaseProviderCoredata()) {
        self.provider = provider
    }

    func loadProfile(completion:@escaping((Profile) -> ())) {
        self.provider.loadProfile(found:completion, notFound: {
            self.provider.createProfile(completion:completion)
        })
    }
    
    func save(project:Project, completion:@escaping(() -> ())) {
        
    }
}
