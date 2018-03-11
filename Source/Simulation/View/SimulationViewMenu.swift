import UIKit

class SimulationViewMenu:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
