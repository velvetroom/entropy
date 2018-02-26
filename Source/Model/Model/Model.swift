import UIKit

internal class Model<ConcreteController:ControllerProtocol>:ModelProtocol {
    typealias SpecialisedControllerProtocol = ConcreteController
    let controller:Model<ConcreteController>.SpecialisedControllerProtocol
    
    init() {
        self.controller = ConcreteController()
    }
}
