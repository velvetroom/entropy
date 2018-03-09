import Foundation

class Controller<SpecialisedViewModel:AbstractViewModel, SpecialisedView:AbstractView>:AbstractController {
    weak var viewModel:SpecialisedViewModel?
    weak var specialisedView:SpecialisedView?
    
    override func loadView() {
        let view:SpecialisedView = SpecialisedView()
        self.view = view
        self.specialisedView = view
    }
}
