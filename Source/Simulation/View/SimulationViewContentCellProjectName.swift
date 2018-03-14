import UIKit

class SimulationViewContentCellProjectName:SimulationViewContentCell {
    private(set) weak var viewField:UITextField?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        let viewField:UITextField = UITextField()
        self.viewField = viewField
        
        self.addSubview(viewField)
        
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
