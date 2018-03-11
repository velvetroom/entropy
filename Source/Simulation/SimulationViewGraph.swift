import UIKit

class SimulationViewGraph:UIView {
    private weak var context:CGContext?
    private var viewModel:SimulationViewModelGraph
    private var centre:CGPoint
    
    init() {
        self.viewModel = SimulationViewModelGraph()
        self.centre = CGPoint.zero
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func updateViewModel(viewModel:SimulationViewModelGraph) {
        self.viewModel = viewModel
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect:CGRect) {
        self.context = UIGraphicsGetCurrentContext()
        self.updateCentre(rect:rect)
        self.drawProductivity()
        self.drawChaos()
    }
    
    private func updateCentre(rect:CGRect) {
        let midWidth:CGFloat = rect.width / 2.0
        let midHeight:CGFloat = rect.height / 2.0
        self.centre = CGPoint(x:midWidth, y:midHeight)
    }
    
    private func drawProductivity() {
        self.context?.setFillColor(UIColor.sharedProductivityColour.cgColor)
        self.context?.addArc(center:self.centre, radius:self.viewModel.radius,
                       startAngle:self.viewModel.productivity.startAngle,
                       endAngle:self.viewModel.productivity.endAngle,
                       clockwise:true)
        self.context?.drawPath(using:CGPathDrawingMode.fill)
    }
    
    private func drawChaos() {
        self.context?.setFillColor(UIColor.sharedChaosColour.cgColor)
        self.context?.addArc(center:self.centre, radius:self.viewModel.radius,
                             startAngle:self.viewModel.chaos.startAngle,
                             endAngle:self.viewModel.chaos.endAngle,
                             clockwise:true)
        self.context?.drawPath(using:CGPathDrawingMode.fill)
    }
}
