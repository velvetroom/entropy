import UIKit

class SimulationControllerGraph:ViewDelegate {
    weak var controller:SimulationController?
    private weak var context:CGContext?
    private var centre:CGPoint
    
    init() {
        self.centre = CGPoint.zero
    }
    
    func draw(rect:CGRect, context:CGContext) {
        self.context = context
        self.configureLine()
        self.updateCentre(rect:rect)
        self.drawProductivity()
        self.drawChaos()
    }
    
    private func updateCentre(rect:CGRect) {
        let midWidth:CGFloat = rect.width / 2.0
        let midHeight:CGFloat = rect.height / 2.0
        self.centre = CGPoint(x:midWidth, y:midHeight)
    }
    
    private func configureLine() {
        guard
            let lineWidth:CGFloat = self.controller?.viewModel?.graph.lineWidth
        else {
            return
        }
        self.context?.setLineWidth(lineWidth)
    }
    
    private func drawProductivity() {
        guard
            let measure:SimulationViewModelGraphMeasure = self.controller?.viewModel?.graph.productivity
        else {
            return
        }
        self.drawMeasure(strokeColour:UIColor.sharedProductivityColour, fillColour:UIColor.white, measure:measure)
    }
    
    private func drawChaos() {
        guard
            let measure:SimulationViewModelGraphMeasure = self.controller?.viewModel?.graph.chaos
        else {
            return
        }
        self.drawMeasure(strokeColour:UIColor.sharedChaosColour, fillColour:UIColor.sharedGrayColour, measure:measure)
    }
    
    private func drawMeasure(strokeColour:UIColor, fillColour:UIColor, measure:SimulationViewModelGraphMeasure) {
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
        guard
            let radius:CGFloat = self.controller?.viewModel?.graph.radius
        else {
            return
        }
        self.context?.addArc(center:self.centre, radius:radius, startAngle:measure.startAngle,
                             endAngle:measure.endAngle, clockwise:false)
    }
}
