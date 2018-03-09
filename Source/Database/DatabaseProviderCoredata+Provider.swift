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
        
    }
}
