import UIKit

class SimulationViewContentCellProjectName:SimulationViewContentCell {
    private(set) weak var viewField:UITextField?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        let viewTitle:UILabel = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.backgroundColor = UIColor.clear
        viewTitle.isUserInteractionEnabled = false
        viewTitle.font = UIFont.systemFont(ofSize:Constants.titleFontSize, weight:UIFont.Weight.light)
        viewTitle.textColor = UIColor.black
        viewTitle.text = String.localizedSimulation(key:"SimulationViewContentCellProjectName_viewTitle")
        
        let viewField:UITextField = UITextField()
        viewField.translatesAutoresizingMaskIntoConstraints = false
        viewField.backgroundColor = UIColor.clear
        viewField.clipsToBounds = true
        viewField.font = UIFont.systemFont(ofSize:Constants.fieldFontSize, weight:UIFont.Weight.medium)
        self.viewField = viewField
        
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.isUserInteractionEnabled = false
        viewBorder.backgroundColor = UIColor.black
        
        self.addSubview(viewTitle)
        self.addSubview(viewField)
        self.addSubview(viewBorder)
        
        viewTitle.layoutTopToTop(view:self, constant:Constants.titleTop)
        viewTitle.layoutHeight(constant:Constants.titleHeight)
        viewTitle.layoutLeftToLeft(view:self, constant:Constants.titleLeft)
        viewTitle.layoutWidthGreaterOrEqual()
        
        viewField.layoutTopToBottom(view:viewTitle)
        viewField.layoutHeight(constant:Constants.fieldHeight)
        viewField.layoutEqualsHorizontal(view:self, margin:Constants.fieldHorizontalMargin)
        
        viewBorder.layoutTopToBottom(view:viewField)
        viewBorder.layoutHeight(constant:1)
        viewBorder.layoutEqualsHorizontal(view:viewField)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override func update(viewModel:SimulationViewModelContentProtocol) {
        super.update(viewModel:viewModel)
        guard
            let viewModel:SimulationViewModelContentProjectName = viewModel as? SimulationViewModelContentProjectName
        else {
            return
        }
        self.viewField?.text = viewModel.project?.name
    }
}
