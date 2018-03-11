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
        self.drawMeasure(strokeColour:UIColor.sharedProductivityColour, fillColour:UIColor.white,
                         measure:self.viewModel.productivity)
    }
    
    private func drawChaos() {
        self.drawMeasure(strokeColour:UIColor.sharedChaosColour, fillColour:UIColor.sharedGrayColour,
                         measure:self.viewModel.chaos)
    }
    
    private func drawMeasure(strokeColour:UIColor, fillColour:UIColor, measure:SimulationViewModelGraphMeasure) {
        self.context?.setLineWidth(self.viewModel.lineWidth)
        self.context?.setFillColor(fillColour.cgColor)
        self.drawMeasurePath(measure:measure)
        self.context?.drawPath(using:CGPathDrawingMode.fill)
        self.context?.setStrokeColor(strokeColour.cgColor)
        self.drawMeasureArch(measure:measure)
        self.context?.drawPath(using:CGPathDrawingMode.stroke)
    }
    
    private func drawMeasurePath(measure:SimulationViewModelGraphMeasure) {
        self.context?.move(to:self.centre)
        self.drawMeasureArch(measure:measure)
        self.context?.closePath()
    }
    
    private func drawMeasureArch(measure:SimulationViewModelGraphMeasure) {
        self.context?.addArc(center:self.centre, radius:self.viewModel.radius,
                             startAngle:measure.startAngle,
                             endAngle:measure.endAngle,
                             clockwise:false)
    }
}
