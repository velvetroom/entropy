import Foundation

internal class Model:AbstractModel {
    internal let viewModel:AbstractViewModel
    internal let controller:AbstractController
    
    required init() {
        fatalError()
    }
    
    internal init<SpecialisedViewModel>(viewModel:SpecialisedViewModel,
                                        controller:Controller<SpecialisedViewModel>) {
        self.viewModel = viewModel
        self.controller = controller
        controller.viewModel = viewModel
        controller.delegate = self
        viewModel.delegate = self
    }
}
