import UIKit

internal class Model<SpecialisedArchitecture>:ModelProtocol,
    ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    internal weak var controller:UIViewController?
    internal let controllerType:ControllerProtocol.Type = SpecialisedArchitecture.GenericController.self
}
