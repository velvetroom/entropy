import UIKit

class SimulationViewScroll:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
