import Foundation

class Model:AbstractModel {
    let viewModel:AbstractViewModel
    let controller:AbstractController
    
    required init() {
        fatalError()
    }
    
    init<SpecialisedViewModel, SpecialisedView>(viewModel:SpecialisedViewModel, controller:Controller<SpecialisedViewModel, SpecialisedView>) {
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
