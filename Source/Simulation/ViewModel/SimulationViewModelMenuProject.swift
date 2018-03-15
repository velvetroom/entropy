import Foundation

class SimulationViewModelMenuProject:SimulationViewModelMenuProtocol {
    weak var project:Project?
    let title:String
    
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
        let itemProjectStartDate:SimulationViewModelContentProjectStartDate =
            SimulationViewModelContentProjectStartDate()
        itemProjectName.project = self.project
        itemProjectStartDate.project = self.project
        let items:[SimulationViewModelContentProtocol] = [
            itemProjectName,
            itemProjectStartDate]
        return items
    }
}
