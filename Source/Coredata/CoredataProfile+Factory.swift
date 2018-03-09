import Foundation

extension CoredataProfile {
    func factoryProfile() -> Profile? {
        guard
            let access:ProfileAccessProtocol = self.factoryAccess(),
            let project:Project = self.project?.factoryProject()
        else {
            return nil
        }
        let profile:Profile = Profile(access:access, project:project)
        return profile
    }
    
    private func factoryAccess() -> ProfileAccessProtocol? {
        return self.access?.accessType as? ProfileAccessProtocol
    }
}
