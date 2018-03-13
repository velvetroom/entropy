import UIKit

class SimulationViewContentCell:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
