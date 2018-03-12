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
        title.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.light)
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.black
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
        } else {
            self.ribbon?.isHidden = true
        }
    }
}
