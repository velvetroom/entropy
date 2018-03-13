import Foundation

class SimulationViewModelMenuLanguages:SimulationViewModelMenuProtocol {
    let title:String
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuLanguages_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let content:SimulationViewModelContent = SimulationViewModelContent()
        return content
    }
}
