import UIKit

internal class AbstractViewController<SpecialisedViewModel:AbstractViewModel>:UIViewController {
    internal weak var viewModel:SpecialisedViewModel?
}
