import Foundation

internal class Controller<SpecialisedViewModel:AbstractViewModel>:AbstractController {
    internal weak var viewModel:SpecialisedViewModel?
}
