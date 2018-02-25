import UIKit

internal extension ModelProtocol {
    internal var viewController:UIViewController? {
        get {
            return self.specialisedController as? UIViewController
        }
    }
    
    var view:UIView? {
        get {
            return self.viewController?.view
        }
    }
}
