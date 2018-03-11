import UIKit

extension SimulationViewModelGraph {
    static func factoryWithEntropy(entropy:Entropy) -> SimulationViewModelGraph {
        var graph:SimulationViewModelGraph = SimulationViewModelGraph()
        graph.chaos = CGFloat(entropy.chaos)
        graph.productivity = CGFloat(entropy.productivity)
        graph.chaos = 0.5
        graph.productivity = 0.5
        return graph
    }
}
