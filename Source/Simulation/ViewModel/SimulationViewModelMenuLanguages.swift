import Foundation

class SimulationViewModelMenuLanguages:SimulationViewModelMenuProtocol {
    let title:String
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuLanguages_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let items:[SimulationViewModelContentProtocol] = [
            SimulationViewModelContentAddLanguage()]
        let content:SimulationViewModelContent = SimulationViewModelContent()
        content.items = items
        return content
    }
}
