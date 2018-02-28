import UIKit

internal class Model<ConcreteControllerProtocol:ControllerProtocol>:ModelProtocol {
    internal typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    internal let controller:SpecialisedControllerProtocol
    internal let viewModel:ConcreteControllerProtocol.SpecialisedView.SpecialisedViewModel
    internal let controllerDelegate:ConcreteControllerProtocol.SpecialisedControllerDelegate
    
    internal var view:ConcreteControllerProtocol.SpecialisedView? {
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
        self.controller = SpecialisedControllerProtocol()
        self.viewModel = ConcreteControllerProtocol.SpecialisedView.SpecialisedViewModel()
        self.controllerDelegate = ConcreteControllerProtocol.SpecialisedControllerDelegate()
        self.assignReferences()
    }
    
    private func assignReferences() {
        self.controller.delegate = self.controllerDelegate
        self.controllerDelegate.viewModel = self.viewModel
    }
}
