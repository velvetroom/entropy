import UIKit

class SimulationViewScrollMenu:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        let viewBorderTop:UIView = UIView()
        viewBorderTop.translatesAutoresizingMaskIntoConstraints = false
        viewBorderTop.isUserInteractionEnabled = false
        viewBorderTop.backgroundColor = UIColor.black
        
        let viewBorderBottom:UIView = UIView()
        viewBorderBottom.translatesAutoresizingMaskIntoConstraints = false
        viewBorderBottom.isUserInteractionEnabled = false
        viewBorderBottom.backgroundColor = UIColor.sharedGrayColour
        
        self.addSubview(viewBorderTop)
        self.addSubview(viewBorderBottom)
        
        viewBorderTop.layoutTopToTop(view:self)
        viewBorderTop.layoutHeight(constant:1)
        viewBorderTop.layoutEqualsHorizontal(view:self)
        
        viewBorderBottom.layoutBottomToBottom(view:self)
        viewBorderBottom.layoutHeight(constant:1)
        viewBorderBottom.layoutEqualsHorizontal(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
