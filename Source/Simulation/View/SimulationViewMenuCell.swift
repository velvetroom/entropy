import UIKit

class SimulationViewMenuCell:UICollectionViewCell {
    private(set) weak var title:UILabel?
    private(set) weak var ribbon:UIView?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
        let title:UILabel = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.isUserInteractionEnabled = false
        title.backgroundColor = UIColor.clear
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.light)
        self.title = title
        
        let ribbon:UIView = UIView()
        ribbon.isUserInteractionEnabled = false
        ribbon.translatesAutoresizingMaskIntoConstraints = false
        ribbon.backgroundColor = UIColor.sharedProductivityColour
        ribbon.clipsToBounds = true
        self.ribbon = ribbon
        
        self.addSubview(title)
        self.addSubview(ribbon)
        
        title.layoutEquals(view:self)
        
        ribbon.layoutBottomToBottom(view:self)
        ribbon.layoutHeight(constant:Constants.ribbonHeight)
        ribbon.layoutEqualsHorizontal(view:self)
        
        self.validateSelected()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    override var isSelected:Bool {
        didSet {
            self.validateSelected()
        }
    }
    
    override var isHighlighted:Bool {
        didSet {
            self.validateSelected()
        }
    }
    
    private func validateSelected() {
        if self.isSelected || self.isHighlighted {
            self.ribbon?.isHidden = false
            self.title?.alpha = 1
        } else {
            self.ribbon?.isHidden = true
            self.title?.alpha = 0.5
        }
    }
}
