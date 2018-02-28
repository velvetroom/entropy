import Foundation

internal final class ViewSimulation:View<SimulationViewModel> {
    
    internal override func factoryViews() {
        super.factoryViews()
        self.viewModel?.shite()
    }
}
