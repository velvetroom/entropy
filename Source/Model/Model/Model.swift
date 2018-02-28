import UIKit

internal class Model<
    ConcreteControllerProtocol:ControllerProtocol,
    ConcreteControllerDelegate:ControllerDelegate,
    ConcreteViewModelProtocol:ViewModelProtocol>:ModelProtocol {
    internal typealias SpecialisedControllerProtocol = ConcreteControllerProtocol
    internal typealias SpecialisedControllerDelegate = ConcreteControllerDelegate
    internal typealias SpecialisedViewModelProtocol = ConcreteViewModelProtocol
    internal let controller:SpecialisedControllerProtocol
    internal let controllerDelegate:SpecialisedControllerDelegate
    internal let viewModel:SpecialisedViewModelProtocol
    
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
        self.controllerDelegate = SpecialisedControllerDelegate()
        self.viewModel = SpecialisedViewModelProtocol()
        self.assignReferences()
    }
    
    private func assignReferences() {
        self.controller.delegate = self.controllerDelegate
        self.controllerDelegate.viewModel = self.viewModel
    }
}
