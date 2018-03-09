import Foundation

class Model:AbstractModel {
    let viewModel:AbstractViewModel
    let controller:AbstractController
    
    required init() {
        fatalError()
    }
    
    init<SpecialisedViewModel>(viewModel:SpecialisedViewModel, controller:Controller<SpecialisedViewModel>) {
        self.viewModel = viewModel
        self.controller = controller
        controller.viewModel = viewModel
        controller.delegate = self
        viewModel.delegate = self
    }
    
    func controllerDidLoad() { }
    func controllerWillAppear() { }
    func controllerDidAppear() { }
}
