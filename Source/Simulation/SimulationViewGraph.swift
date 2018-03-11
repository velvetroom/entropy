import UIKit

class SimulationViewGraph:UIView {
    var viewModel:SimulationViewModelGraph?
    
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func draw(_ rect:CGRect) {
        guard
            let viewModel:SimulationViewModelGraph = self.viewModel,
            let context:CGContext = UIGraphicsGetCurrentContext()
        else {
            return
        }
        self.draw(rect:rect, viewModel:viewModel, context:context)
    }
    
    private func draw(rect:CGRect, viewModel:SimulationViewModelGraph, context:CGContext) {
        let midWidth:CGFloat = rect.width / 2.0
        let midHeight:CGFloat = rect.height / 2.0
        let centre:CGPoint = CGPoint(x:midWidth, y:midHeight)
        context.setFillColor(UIColor.sharedGrayColour.cgColor)
        context.addArc(center:centre, radius:viewModel.radius, startAngle:viewModel.startAngle,
                       endAngle:viewModel.endAngle, clockwise:true)
        context.drawPath(using:CGPathDrawingMode.fill)
    }
}
