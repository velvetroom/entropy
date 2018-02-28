import Foundation

internal final class ViewSimulation:View, ViewProtocol {
    internal typealias ConcreteViewModel = SimulationViewModel
    internal weak var viewModel:ConcreteViewModel?
    
    internal override func factoryViews() {
        super.factoryViews()
        self.viewModel?.shite()
    }
}
