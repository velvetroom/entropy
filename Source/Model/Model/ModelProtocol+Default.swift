import UIKit

internal extension ModelProtocol {
    internal mutating func factoryController() -> UIViewController? {
        let controllerType:UIViewController.Type? = self.controllerType as? UIViewController.Type
        let controller:UIViewController? = controllerType?.init()
        self.controller = controller
        return controller
    }
}
