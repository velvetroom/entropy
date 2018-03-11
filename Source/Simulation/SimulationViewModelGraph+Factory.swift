import Foundation

extension SimulationViewModelGraph {
    static func factoryFullProductivity() -> SimulationViewModelGraph {
        let graph:SimulationViewModelGraph = SimulationViewModelGraph(chaos:0, productivity:1)
        return graph
    }
}
