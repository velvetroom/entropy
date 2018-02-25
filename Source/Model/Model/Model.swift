import UIKit

internal class Model<SpecialisedArchitecture>:ModelProtocol,
    ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    internal var controller:SpecialisedArchitecture.GenericController?
    
    internal final func loadController() -> UIViewController? {
        if self.controller == nil {
            self.controller = SpecialisedArchitecture.GenericController.init()
        }
        return self.controller as? UIViewController
    }
}
