import UIKit

internal final class Simulation:AbstractModelProtocol {
    internal typealias ViewModel = SimulationViewModel
    var viewModel:AbstractViewModelProtocol
    var controller:UIViewController
}
