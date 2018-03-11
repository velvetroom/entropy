import UIKit

class SimulationViewScroll:UICollectionView,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewScroll.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.alwaysBounceVertical = true
        self.delegate = self
        self.dataSource = self
        self.register(SimulationViewScrollMenu.self, forCellWithReuseIdentifier:Constants.cellMenu)
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier:Constants.cellContent)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection section:Int) -> Int {
        return 2
    }
    
    func collectionView(_:UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell
        if indexPath.item == 0 {
            cell = self.dequeueReusableCell(withReuseIdentifier:Constants.cellMenu, for:indexPath)
        } else {
            cell = self.dequeueReusableCell(withReuseIdentifier:Constants.cellContent, for:indexPath)
        }
        return cell
    }
}
