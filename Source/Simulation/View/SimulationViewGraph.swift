import UIKit

class SimulationViewGraph:UIView {
    weak var delegate:ViewDelegate?
    
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
            let context:CGContext = UIGraphicsGetCurrentContext()
        else {
            return
        }
        self.delegate?.draw(rect:rect, context:context)
    }
}
