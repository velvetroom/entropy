import Foundation

internal class AbstractController<SpecialisedViewModel:AbstractViewModelProtocol>:AbstractControllerPrototype {
    internal weak var viewModel:SpecialisedViewModel?
    
    internal required init(viewModel:AbstractViewModelProtocol) {
        self.viewModel = viewModel as? SpecialisedViewModel
        super.init(viewModel:viewModel)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
