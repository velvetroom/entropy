import Foundation

class Profile {
    private(set) var access:ProfileAccessProtocol
    
    init(access:ProfileAccessProtocol) {
        self.access = access
    }
}
