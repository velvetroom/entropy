import Foundation

class SimulationViewModelMenuProject:SimulationViewModelMenuProtocol {
    let title:String
    weak var project:Project?
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuProject_title")
    }
    
    func factoryViewModel() -> SimulationViewModelContent {
        let items:[SimulationViewModelContentProtocol] = self.factoryContentItems()
        let content:SimulationViewModelContent = SimulationViewModelContent()
        content.items = items
        return content
    }
    
    private func factoryContentItems() -> [SimulationViewModelContentProtocol] {
        let itemProjectName:SimulationViewModelContentProjectName = SimulationViewModelContentProjectName()
        itemProjectName.project = self.project
        let items:[SimulationViewModelContentProtocol] = [
            itemProjectName]
        return items
    }
}
