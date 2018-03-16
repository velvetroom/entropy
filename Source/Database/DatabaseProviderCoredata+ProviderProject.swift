import Foundation
import CoreData

extension DatabaseProviderCoredata {
    private var projectRequest:NSFetchRequest<CoredataProject> {
        get {
            let request:NSFetchRequest<CoredataProject> = NSFetchRequest(entityName:CoredataProject.name)
            request.fetchLimit = 0
            request.returnsObjectsAsFaults = false
            return request
        }
    }
    
    func createProject(completion:@escaping((Project) -> ())) {
        self.createCoredataProject { (coredataProject:CoredataProject) in
            guard
                let project:Project = coredataProject.factoryProject()
            else {
                return
            }
            completion(project)
        }
    }
    
    func createCoredataProject(completion:@escaping((CoredataProject) -> ())) {
        self.create(completion:completion)
    }
    
    func loadProject(identifier:String, found:@escaping((Project) -> ()), notFound:@escaping(() -> ())) {
        
    }
    
    func save(project:Project, completion:@escaping(() -> ())) {
        
    }
}
