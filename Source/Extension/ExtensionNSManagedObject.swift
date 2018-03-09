import Foundation
import CoreData

extension NSManagedObject {
    class var name:String {
        get {
            return String(describing:self)
        }
    }
}
