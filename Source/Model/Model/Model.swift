import UIKit

internal class Model<SpecialisedArchitecture>:ModelProtocol,
    ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    internal let controller:SpecialisedArchitecture.GenericController
    
    internal var specialisedController:ControllerProtocol {
        get {
            return self.controller
        }
    }
    
    internal init() {
        self.controller = SpecialisedArchitecture.GenericController.init()
    }
}
