import UIKit

struct SimulationViewModelGraph {
    var chaos:CGFloat
    var productivity:CGFloat
    let radius:CGFloat
    let startAngle:CGFloat
    let endAngle:CGFloat
    
    init() {
        self.chaos = 0
        self.productivity = 0
        self.radius = Constants.radius
        self.startAngle = Constants.startAngle
        self.endAngle = Constants.endEngle
    }
}
