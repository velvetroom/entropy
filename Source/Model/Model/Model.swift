import UIKit

internal class Model<ConcreteControllerProtocol:ControllerProtocol>:ModelProtocol, ControllerDelegate {
    internal typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    internal let controller:SpecialisedControllerProtocol
    
    internal var view:ConcreteControllerProtocol.SpecialisedView? {
        get {
            guard
                let controller:UIViewController = self.controller as? UIViewController,
                controller.view === self.controller.viewSpecialised
            else {
                return nil
            }
            return self.controller.viewSpecialised
        }
    }
    
    internal init() {
        var controller:SpecialisedControllerProtocol = SpecialisedControllerProtocol()
        self.controller = controller
        controller.delegate = self
    }
}
