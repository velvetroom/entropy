import Foundation

internal class Controller<SpecialisedViewModel:AbstractViewModel>:AbstractController {
    internal weak var delegate:ControllerDelegate?
    internal weak var viewModel:SpecialisedViewModel?
}
