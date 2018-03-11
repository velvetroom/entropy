import Foundation

class SimulationViewModelMenuProject:SimulationViewModelMenuProtocol {
    let title:String
    
    init() {
        self.title = String.localizedSimulation(key:"SimulationViewModelMenuProject_title")
    }
}
