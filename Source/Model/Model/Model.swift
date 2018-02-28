import UIKit

internal class Model<ConcreteProtocol:ControllerProtocol, ConcreteController:ControllerProtocol>:ModelProtocol {
    internal typealias SpecialisedController = ConcreteController
    internal let controller:SpecialisedController
    internal let delegate:SpecialisedController.SpecialisedDelegate
    internal let viewModel:SpecialisedController.SpecialisedViewModel
    
    internal var view:SpecialisedController.SpecialisedView? {
        get {
            guard
                let controller:UIViewController = self.controller as? UIViewController,
                controller.view === self.controller.viewSpecialised
            else {
                return nil
            }
            return self.controller.viewSpecialised
        }
    }
    
    internal init() {
        self.controller = SpecialisedController()
        self.delegate = SpecialisedController.SpecialisedDelegate()
        self.viewModel = SpecialisedController.SpecialisedViewModel()
        self.assignReferences()
    }
    
    private func assignReferences() {
        self.controller.delegate = self.delegate
        self.delegate.viewModel = self.viewModel
    }
}
