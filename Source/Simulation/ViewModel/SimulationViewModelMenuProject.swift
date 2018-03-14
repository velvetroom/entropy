import Foundation

class SimulationViewModelMenuProject:SimulationViewModelMenuProtocol {
    let title:String
    weak var project:Project?
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuProject_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let items:[SimulationViewModelContentProtocol] = [
            SimulationViewModelContentProjectName()]
        let content:SimulationViewModelContent = SimulationViewModelContent()
        content.items = items
        return content
    }
}
