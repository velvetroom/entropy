import Foundation

internal protocol ModelProtocol:AnyObject {
    associatedtype SpecialisedController:ControllerProtocol
    
    var controller:SpecialisedController { get }
    var delegate:SpecialisedController.SpecialisedDelegate { get }
    var viewModel:SpecialisedController.SpecialisedViewModel { get }
}
