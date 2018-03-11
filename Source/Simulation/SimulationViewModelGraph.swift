import UIKit

struct SimulationViewModelGraph {
    var chaos:SimulationViewModelGraphMeasure
    var productivity:SimulationViewModelGraphMeasure
    let radius:CGFloat
    
    init() {
        self.chaos = SimulationViewModelGraphMeasure()
        self.productivity = SimulationViewModelGraphMeasure()
        self.radius = Constants.radius
    }
}
