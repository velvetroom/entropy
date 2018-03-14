import UIKit

class SimulationViewScroll:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewScroll.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alwaysBounceVertical = true
        self.register(SimulationViewScrollMenu.self, forCellWithReuseIdentifier:Constants.cellMenu)
        self.register(SimulationViewScrollContent.self, forCellWithReuseIdentifier:Constants.cellContent)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
