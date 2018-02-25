import UIKit

internal extension PresentationProtocol {
    internal var viewController:UIViewController? {
        get {
            return self.model.viewController
        }
    }
    
    internal var view:UIView? {
        get {
            return self.model.view
        }
    }
}
