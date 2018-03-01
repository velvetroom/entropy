import Foundation

internal class Controller<SpecialisedViewModel:AbstractViewModel>:AbstractController {
    internal weak var viewModel:SpecialisedViewModel?
    
    internal required init(viewModel:AbstractViewModel) {
        self.viewModel = viewModel as? SpecialisedViewModel
        super.init(viewModel:viewModel)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
