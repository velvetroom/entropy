import UIKit

class SimulationViewScrollContent:UICollectionViewCell {
    private(set) weak var viewContent:SimulationViewContent?
    private(set) weak var layoutContentTop:NSLayoutConstraint?
    private(set) weak var layoutContentBottom:NSLayoutConstraint?
    private(set) weak var layoutContentLeft:NSLayoutConstraint?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
        let viewContent:SimulationViewContent = SimulationViewContent()
        self.viewContent = viewContent
        
        self.addSubview(viewContent)
        
        self.layoutContentTop = viewContent.layoutTopToTop(view:self)
        self.layoutContentBottom = viewContent.layoutBottomToBottom(view:self)
        self.layoutContentLeft = viewContent.layoutLeftToLeft(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
