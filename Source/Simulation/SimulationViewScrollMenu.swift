import UIKit

class SimulationViewScrollMenu:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        let viewBorder:UIView = UIView()
        viewBorder.translatesAutoresizingMaskIntoConstraints = false
        viewBorder.isUserInteractionEnabled = false
        viewBorder.backgroundColor = UIColor.black
        
        self.addSubview(viewBorder)
        
        viewBorder.layoutTopToTop(view:self)
        viewBorder.layoutHeight(constant:1)
        viewBorder.layoutEqualsHorizontal(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
