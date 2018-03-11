import UIKit

struct SimulationViewModelGraph {
    var chaos:SimulationViewModelGraphMeasure
    var productivity:SimulationViewModelGraphMeasure
    let radius:CGFloat
    let lineWidth:CGFloat
    
    init() {
        self.chaos = SimulationViewModelGraphMeasure()
        self.productivity = SimulationViewModelGraphMeasure()
        self.radius = Constants.radius
        self.lineWidth = Constants.lineWidth
    }
}
