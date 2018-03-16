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
    
    func createProject(completion:@escaping((Project) -> ())) {
        self.provider.createProject(completion:completion)
    }
    
    func loadProject(identifier:String, found:@escaping((Project) -> ())) {
        self.provider.loadProject(identifier:identifier, found:found) { }
    }
    
    func save(project:Project, completion:@escaping(() -> ())) {
        self.provider.save(project:project, completion:completion)
    }
}
