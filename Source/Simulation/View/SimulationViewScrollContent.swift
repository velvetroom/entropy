import UIKit

class SimulationViewScrollContent:UICollectionViewCell {
    private(set) weak var viewContent:SimulationViewContent?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
        let viewContent:SimulationViewContent = SimulationViewContent()
        self.viewContent = viewContent
        
        self.addSubview(viewContent)
        
        viewContent.layoutEquals(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
