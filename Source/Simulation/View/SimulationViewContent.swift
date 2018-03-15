import UIKit

class SimulationViewContent:UICollectionView {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewContent.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.clear
        self.alwaysBounceHorizontal = false
        self.alwaysBounceVertical = false
        self.isScrollEnabled = false
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.register(SimulationViewContentCellProjectName.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.projectName)
        self.register(SimulationViewContentCellProjectStartDate.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.projectStartDate)
        self.register(SimulationViewContentCellAddContributor.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.addContributor)
        self.register(SimulationViewContentCellAddLanguage.self,
                      forCellWithReuseIdentifier:Constants.CellIdentifiers.addLanguage)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
