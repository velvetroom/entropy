import UIKit

class SimulationViewScroll:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewScroll.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alwaysBounceVertical = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(SimulationViewScrollMenu.self, forCellWithReuseIdentifier:Constants.cellMenu)
        self.register(SimulationViewScrollContent.self, forCellWithReuseIdentifier:Constants.cellContent)
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentBehavior.never
        }
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
