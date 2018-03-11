import Foundation

extension SimulationViewModelGraph {
    static func factoryWithEntropy(entropy:Entropy) -> SimulationViewModelGraph {
        var graph:SimulationViewModelGraph = SimulationViewModelGraph()
        graph.chaos = entropy.chaos
        graph.productivity = entropy.productivity
        return graph
    }
}
