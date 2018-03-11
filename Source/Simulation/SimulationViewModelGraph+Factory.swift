import UIKit

extension SimulationViewModelGraph {
    static func factoryWithEntropy(entropy:Entropy) -> SimulationViewModelGraph {
        var graph:SimulationViewModelGraph = SimulationViewModelGraph()
        graph.chaos = CGFloat(entropy.chaos)
        graph.productivity = CGFloat(entropy.productivity)
        return graph
    }
}
