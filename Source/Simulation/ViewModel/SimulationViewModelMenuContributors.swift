import Foundation

class SimulationViewModelMenuContributors:SimulationViewModelMenuProtocol {
    let title:String
    weak var project:Project?
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuContributors_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let items:[SimulationViewModelContentProtocol] = [
            SimulationViewModelContentAddContributor()]
        let content:SimulationViewModelContent = SimulationViewModelContent()
        content.items = items
        return content
    }
}
