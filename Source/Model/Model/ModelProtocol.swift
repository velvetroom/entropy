import UIKit

internal protocol ModelProtocol {
    var specialisedController:ControllerProtocol { get }
    var viewController:UIViewController? { get }
    var view:UIView? { get }
}
