import Foundation

class SimulationController:Controller<SimulationViewModel> {
    override func loadView() {
        let view:SimulationView = SimulationView()
        self.view = view
    }
    
    override func reloadViewModel() {
        
    }
}
