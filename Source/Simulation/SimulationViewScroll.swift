import UIKit

class SimulationViewScroll:UICollectionView,
UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    private(set) weak var viewMenu:SimulationViewMenu?
    
    init() {
        let layout:UICollectionViewFlowLayout = SimulationViewScroll.factoryLayout()
        super.init(frame:CGRect.zero, collectionViewLayout:layout)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
        self.delegate = self
        self.dataSource = self
        self.register(UICollectionViewCell.self, forCellWithReuseIdentifier:Constants.cellMenu)
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
            cell = self.dequeueCellMenu(indexPath:indexPath)
        } else {
            cell = self.dequeCellContent(indexPath:indexPath)
        }
        return cell
    }
    
    private func dequeueCellMenu(indexPath:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = self.dequeueReusableCell(withReuseIdentifier:Constants.cellMenu,
                                                                 for:indexPath)
        if self.viewMenu == nil {
            
        }
        return cell
    }
    
    private func dequeCellContent(indexPath:IndexPath) -> UICollectionViewCell {
        
    }
}
