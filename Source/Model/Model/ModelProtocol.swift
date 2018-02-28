import Foundation

internal protocol ModelProtocol {
    associatedtype SpecialisedControllerProtocol:ControllerProtocol
    associatedtype SpecialisedControllerDelegate:ControllerDelegate
    associatedtype SpecialisedViewModelProtocol:ViewModelProtocol
    
    var controller:SpecialisedControllerProtocol { get }
    var controllerDelegate:ControllerDelegate { get }
    var viewModel:ViewModelProtocol { get }
}
