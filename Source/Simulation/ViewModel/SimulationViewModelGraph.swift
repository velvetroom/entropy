import UIKit

struct SimulationViewModelGraph {
    var chaos:SimulationViewModelGraphMeasure
    var productivity:SimulationViewModelGraphMeasure
    var centre:CGPoint
    let radius:CGFloat
    let lineWidth:CGFloat
    
    init() {
        self.chaos = SimulationViewModelGraphMeasure()
        self.productivity = SimulationViewModelGraphMeasure()
        self.centre = CGPoint.zero
        self.radius = Constants.radius
        self.lineWidth = Constants.lineWidth
    }
}
