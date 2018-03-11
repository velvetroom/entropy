import UIKit

struct SimulationViewModelGraphMeasure {
    var name:String
    var colour:UIColor
    var startAngle:CGFloat
    var endAngle:CGFloat
    
    init(name:String) {
        self.name = name
        self.colour = UIColor.clear
        self.startAngle = 0
        self.endAngle = 0
    }
}
