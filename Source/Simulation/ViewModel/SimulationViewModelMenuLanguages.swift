import Foundation

class SimulationViewModelMenuLanguages:SimulationViewModelMenuProtocol {
    let title:String
    private(set) weak var project:Project?
    
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
    
    func update(project:Project) {
        self.project = project
    }
}
