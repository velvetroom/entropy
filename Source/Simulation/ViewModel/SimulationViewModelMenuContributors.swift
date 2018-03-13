import Foundation

class SimulationViewModelMenuContributors:SimulationViewModelMenuProtocol {
    let title:String
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuContributors_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let content:SimulationViewModelContent = SimulationViewModelContent()
        return content
    }
}
