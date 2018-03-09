import Foundation

extension CoredataProfile {
    func factoryProfile() -> Profile? {
        guard
            let access:ProfileAccessProtocol = self.factoryAccess()
        else {
            return nil
        }
        let profile:Profile = Profile(access:access)
        return profile
    }
    
    private func factoryAccess() -> ProfileAccessProtocol? {
        return self.access?.accessType as? ProfileAccessProtocol
    }
}
