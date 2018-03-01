import UIKit

internal final class Simulation:AbstractModelProtocol {
    internal typealias ViewModel = SimulationViewModel
    internal typealias Controller = SimulationController
    var viewModel:AbstractViewModelProtocol
    var controller:UIViewController
}
