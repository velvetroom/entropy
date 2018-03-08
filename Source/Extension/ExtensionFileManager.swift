import Foundation

internal extension FileManager {
    internal var applicationDirectory:URL {
        get {
            let url:[URL] = urls(for:FileManager.SearchPathDirectory.documentDirectory,
                                 in:FileManager.SearchPathDomainMask.userDomainMask)
            guard
                let last:URL = url.last
            else {
                fatalError()
            }
            return last
        }
    }
}
