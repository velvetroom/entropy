import UIKit

extension SimulationViewModelGraph {
    static func factoryWithEntropy(entropy:Entropy) -> SimulationViewModelGraph {
        var graph:SimulationViewModelGraph = SimulationViewModelGraph()
        graph.productivity = factoryProductivity(entropy:entropy)
        graph.chaos = factoryChaos(entropy:entropy, productivity:graph.productivity)
        return graph
    }
    
    private static func factoryChaos(
        entropy:Entropy, productivity:SimulationViewModelGraphMeasure) -> SimulationViewModelGraphMeasure {
        let chaosAmount:CGFloat = CGFloat(entropy.chaos)
        let chaosRadians:CGFloat = chaosAmount * Constants.circleRadians
        var measure:SimulationViewModelGraphMeasure = SimulationViewModelGraphMeasure()
        measure.startAngle = productivity.endAngle
        measure.endAngle = measure.startAngle + chaosRadians
        return measure
    }
    
    private static func factoryProductivity(entropy:Entropy) -> SimulationViewModelGraphMeasure {
        let productivityAmount:CGFloat = CGFloat(entropy.productivity)
        let productivityRadians:CGFloat = productivityAmount * Constants.circleRadians
        var measure:SimulationViewModelGraphMeasure = SimulationViewModelGraphMeasure()
        measure.startAngle = Constants.startAngle
        measure.endAngle = measure.startAngle + productivityRadians
        return measure
    }
}
