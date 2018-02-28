import Foundation

internal protocol ControllerDelegate:AnyObject {
    associatedtype SpecialisedModel:ModelProtocol
    weak var model:SpecialisedModel? { get set }
    weak var viewModel:SpecialisedModel.SpecialisedController.SpecialisedViewModel? { get set }
    
    init()
    func controllerDidLoad()
    func controllerDidAppear()
}
