import UIKit

internal class Model<ConcreteControllerProtocol:ControllerProtocol>:ModelProtocol, ControllerDelegate {
    typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    let controller:SpecialisedControllerProtocol
    
    init() {
        var controller:SpecialisedControllerProtocol = SpecialisedControllerProtocol()
        controller.delegate = self
        self.controller = controller
    }
}
