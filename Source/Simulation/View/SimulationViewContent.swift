import UIKit

class SimulationViewContent:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewContent.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = true
        self.showsVerticalScrollIndicator = true
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
