import UIKit

class SimulationViewMenu:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewMenu.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.alwaysBounceHorizontal = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(SimulationViewMenuCell.self, forCellWithReuseIdentifier:Constants.cell)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
