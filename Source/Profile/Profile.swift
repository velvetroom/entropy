import Foundation

class Profile {
    private(set) var access:ProfileAccessProtocol
    private(set) var project:Project
    
    init(access:ProfileAccessProtocol, project:Project) {
        self.access = access
        self.project = project
    }
}
