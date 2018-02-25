import UIKit

internal protocol ModelProtocol {
    weak var controller:UIViewController? { get set }
    var controllerType:ControllerProtocol.Type { get }
    
    func factoryController() -> UIViewController?
}
