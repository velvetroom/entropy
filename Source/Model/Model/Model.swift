import UIKit

internal class Model<ConcreteControllerProtocol:ControllerProtocol>:ModelProtocol {
    typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    let controller:SpecialisedControllerProtocol
    
    init() {
        self.controller = SpecialisedControllerProtocol()
    }
}
