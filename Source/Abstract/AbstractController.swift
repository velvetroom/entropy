import Foundation

internal class AbstractController<
    ConcreteViewModel, ConcreteViewController:AbstractViewController<ConcreteViewModel>>:AbstractControllerProtocol {
    internal typealias SpecialisedViewModel = ConcreteViewModel
    internal typealias SpecialisedViewController = ConcreteViewController
    internal weak var delegate:ControllerDelegate?
    internal let viewController:SpecialisedViewController
    
    internal required init(viewController:SpecialisedViewController) {
        self.viewController = viewController
    }
}
