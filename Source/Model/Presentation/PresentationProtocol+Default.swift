import UIKit

internal extension PresentationProtocol {
    internal weak var view:UIView? {
        get {
            return self.controller?.view
        }
    }
    
    internal mutating func factoryArchitecture() {
        let controllerType:ControllerProtocol.Type = self.model.controllerType
        self.controller = controllerType.factoryController()
    }
}
