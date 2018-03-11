import UIKit

class SimulationControllerGraph:ViewDelegate {
    var viewModel:SimulationViewModelGraph
    private weak var context:CGContext?
    
    init() {
        self.viewModel = SimulationViewModelGraph()
    }
    
    func draw(rect:CGRect, context:CGContext) {
        self.context = context
        self.updateCentre(rect:rect)
        self.drawProductivity()
        self.drawChaos()
    }
    
    private func updateCentre(rect:CGRect) {
        let midWidth:CGFloat = rect.width / 2.0
        let midHeight:CGFloat = rect.height / 2.0
        self.viewModel.centre = CGPoint(x:midWidth, y:midHeight)
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
        self.context?.move(to:self.viewModel.centre)
        self.drawMeasureArch(measure:measure)
        self.context?.closePath()
    }
    
    private func drawMeasureArch(measure:SimulationViewModelGraphMeasure) {
        self.context?.addArc(center:self.viewModel.centre, radius:self.viewModel.radius,
                             startAngle:measure.startAngle,
                             endAngle:measure.endAngle,
                             clockwise:false)
    }
}
