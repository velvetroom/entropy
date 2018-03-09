import Foundation

extension FileManager {
    var applicationDirectory:URL {
        get {
            let url:[URL] = urls(for:FileManager.SearchPathDirectory.documentDirectory,
                                 in:FileManager.SearchPathDomainMask.userDomainMask)
            return url.last!
        }
    }
}
