import UIKit

internal class Model<ConcreteControllerProtocol:ControllerProtocol>:ModelProtocol, ControllerDelegate {
    internal typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    internal let controller:SpecialisedControllerProtocol
    
    internal init() {
        var controller:SpecialisedControllerProtocol = SpecialisedControllerProtocol()
        self.controller = controller
        controller.delegate = self
    }
}
