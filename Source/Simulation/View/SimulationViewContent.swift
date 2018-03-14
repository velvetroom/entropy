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
        self.register(SimulationViewContentCellProjectName.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.projectName)
        self.register(SimulationViewContentCellAddContributor.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.addContributor)
        self.register(SimulationViewContentCellAddLanguage.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.addLanguage)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
