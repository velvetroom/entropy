import UIKit

internal class AbstractController<SpecialisedViewModel:AbstractViewModel>:UIViewController {
    internal weak var viewModel:SpecialisedViewModel?
    
    internal required init(viewModel:SpecialisedViewModel) {
        self.viewModel = viewModel
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
