import Foundation

class Controller<SpecialisedViewModel:AbstractViewModel>:AbstractController {
    weak var viewModel:SpecialisedViewModel?
}
