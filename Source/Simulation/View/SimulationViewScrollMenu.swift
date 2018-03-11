import UIKit

class SimulationViewScrollMenu:UICollectionViewCell {
    private(set) weak var viewMenu:SimulationViewMenu?
    
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
        
        let viewMenu:SimulationViewMenu = SimulationViewMenu()
        self.viewMenu = viewMenu
        
        self.addSubview(viewBorderTop)
        self.addSubview(viewBorderBottom)
        self.addSubview(viewMenu)
        
        viewBorderTop.layoutTopToTop(view:self)
        viewBorderTop.layoutHeight(constant:1)
        viewBorderTop.layoutEqualsHorizontal(view:self)
        
        viewBorderBottom.layoutBottomToBottom(view:self)
        viewBorderBottom.layoutHeight(constant:1)
        viewBorderBottom.layoutEqualsHorizontal(view:self)
        
        viewMenu.layoutEqualsVertical(view:self, margin:1)
        viewMenu.layoutEqualsHorizontal(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
