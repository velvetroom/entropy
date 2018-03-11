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
    
    func collectionView(_:UICollectionView, layout:UICollectionViewLayout, sizeForItemAt index:IndexPath) -> CGSize {
        if index.item == 0 {
            return CGSize(width:self.bounds.width, height:SimulationView.Constants.menuHeight)
        }
        let usedHeight:CGFloat = SimulationView.Constants.menuHeight + SimulationView.Constants.graphHeight
        let remainHeight:CGFloat = self.bounds.height - usedHeight
        return CGSize(width:self.bounds.width, height:remainHeight)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 2
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        if index.item == 0 {
            return self.dequeueReusableCell(withReuseIdentifier:Constants.cellMenu, for:index)
        }
        return self.dequeueReusableCell(withReuseIdentifier:Constants.cellContent, for:index)
    }
}
