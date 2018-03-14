import UIKit

class SimulationViewContentCellProjectName:SimulationViewContentCell {
    private(set) weak var viewTitle:UILabel?
    private(set) weak var viewField:UITextField?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        let viewTitle:UILabel = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.backgroundColor = UIColor.clear
        viewTitle.isUserInteractionEnabled = false
        viewTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.light)
        viewTitle.textColor = UIColor.black
        self.viewTitle = viewTitle
        
        let viewField:UITextField = UITextField()
        self.viewField = viewField
        
        self.addSubview(viewTitle)
        self.addSubview(viewField)
        
        viewTitle.layoutTopToTop(view:self)
        viewTitle.layoutHeight(constant:Constants.titleHeight)
        viewTitle.layoutLeftToLeft(view:self, constant:Constants.titleLeft)
        viewTitle.layoutWidthGreaterOrEqual()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
