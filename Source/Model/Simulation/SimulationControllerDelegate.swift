import Foundation

internal final class SimulationControllerDelegate:ControllerDelegate {
    internal typealias SpecialisedModel = Simulation
    internal weak var model:Simulation?
    internal weak var viewModel:ViewModelProtocol?
}
