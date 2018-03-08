import Foundation
import CoreData

internal extension NSManagedObject {
    internal class var name:String {
        get {
            return String(describing:self)
        }
    }
}
