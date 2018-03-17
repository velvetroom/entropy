import Foundation
import CoreData

extension DatabaseProviderCoredata {
    private var projectRequest:NSFetchRequest<CoredataProject> {
        get {
            let request:NSFetchRequest<CoredataProject> = NSFetchRequest(entityName:CoredataProject.name)
            request.fetchLimit = 1
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
        let request:NSFetchRequest<CoredataProject> = self.factoryRequestToLoadProject(identifier:identifier)
        self.load(request:request) { (coredataProjects:[CoredataProject]) in
            guard
                let coredataProject:CoredataProject = coredataProjects.first,
                let project:Project = coredataProject.factoryProject()
            else {
                notFound()
                return
            }
            found(project)
        }
    }
    
    private func factoryRequestToLoadProject(identifier:String) -> NSFetchRequest<CoredataProject> {
        let request:NSFetchRequest<CoredataProject> = self.projectRequest
        request.predicate = self.factoryPredicateToLoadProject(identifier:identifier)
        return request
    }
    
    private func factoryPredicateToLoadProject(identifier:String) -> NSPredicate {
        return NSPredicate(format:"identifier == %@", identifier)
    }
    
    func save(project:Project, completion:@escaping(() -> ())) {
        
    }
}
