import Foundation
import CoreData

extension DatabaseProviderCoredata {
    private var profileRequest:NSFetchRequest<CoredataProfile> {
        get {
            let request:NSFetchRequest<CoredataProfile> = NSFetchRequest(entityName:CoredataProfile.name)
            request.fetchLimit = 0
            request.returnsObjectsAsFaults = false
            return request
        }
    }
    
    func loadProfile(found:@escaping((Profile) -> ()), notFound:@escaping(() -> ())) {
        self.load(request:self.profileRequest) { (coredataProfiles:[CoredataProfile]) in
            guard
                let coredataProfile:CoredataProfile = coredataProfiles.first,
                let profile:Profile = coredataProfile.factoryProfile()
            else {
                notFound()
                return
            }
            found(profile)
        }
    }
    
    func createProfile(completion:@escaping((Profile) -> ())) {
        self.create { (coredataProfile:CoredataProfile) in
            self.configureNewProfile(coredataProfile:coredataProfile, completion:completion)
        }
    }
    
    func save(project:Project, completion:@escaping (() -> ())) {
        
    }
    
    private func configureNewProfile(coredataProfile:CoredataProfile, completion:@escaping((Profile) -> ())) {
        self.createFreeAccess { (access:CoredataProfileAccessFree) in
            coredataProfile.access = access
            self.createProject { (project:CoredataProject) in
                coredataProfile.project = project
                self.newProfileReady(coredataProfile:coredataProfile, completion:completion)
            }
        }
    }
    
    private func createFreeAccess(completion:@escaping((CoredataProfileAccessFree) -> ())) {
        self.create(completion:completion)
    }
    
    private func createProject(completion:@escaping((CoredataProject) -> ())) {
        self.create(completion:completion)
    }
    
    private func newProfileReady(coredataProfile:CoredataProfile, completion:@escaping((Profile) -> ())) {
        self.save {
            guard
                let profile:Profile = coredataProfile.factoryProfile()
            else {
                return
            }
            completion(profile)
        }
    }
}
