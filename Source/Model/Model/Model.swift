import UIKit

internal class Model<SpecialisedArchitecture>:ModelProtocol,  ControllerDelegate, 
ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    internal let controller:SpecialisedArchitecture.GenericController
    
    internal var specialisedController:ControllerProtocol {
        get {
            return self.controller
        }
    }
    
    internal init() {
        var controller:SpecialisedArchitecture.GenericController = SpecialisedArchitecture.GenericController.init()
        self.controller = controller
        controller.delegate = self
    }
}
