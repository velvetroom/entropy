import UIKit

internal extension ControllerProtocol {
    internal static func factoryController() -> UIViewController? {
        let controllerType:UIViewController.Type? = self as? UIViewController.Type
        return controllerType?.init()
    }
}
