import Foundation

internal protocol ModelProtocol:AnyObject {
    associatedtype SpecialisedControllerProtocol:ControllerProtocol
    
    var controller:SpecialisedControllerProtocol { get }
    var controllerDelegate:SpecialisedControllerProtocol.SpecialisedControllerDelegate { get }
    var viewModel:SpecialisedControllerProtocol.SpecialisedView.SpecialisedViewModel { get }
}
