import UIKit

class SimulationViewScrollMenu:UICollectionViewCell {
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
