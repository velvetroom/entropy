import UIKit

class SimulationControllerScroll:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    let menu:SimulationControllerMenu
    
    override init() {
        self.menu = SimulationControllerMenu()
        super.init()
    }
    
    func update(viewScroll:SimulationViewScroll) {
        self.menu.viewScroll = viewScroll
        viewScroll.delegate = self
        viewScroll.dataSource = self
    }
    
    func dequeueMenuCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:SimulationViewScroll.Constants.cellMenu, for:index)
        if let cellMenu:SimulationViewScrollMenu = cell as? SimulationViewScrollMenu {
            self.menu.viewMenu = cellMenu.viewMenu
        }
        return cell
    }
    
    func dequeueContentCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:SimulationViewScroll.Constants.cellContent, for:index)
        if let cellContent:SimulationViewScrollContent = cell as? SimulationViewScrollContent {
            self.menu.content.viewContent = cellContent.viewContent
        }
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt index:IndexPath) -> CGSize {
        if index.item == 0 {
            return CGSize(width:collectionView.bounds.width, height:SimulationView.Constants.menuHeight)
        }
        guard
            let itemsHeight:CGFloat = self.menu.viewModel?.content.itemsHeight
        else {
            return CGSize.zero
        }
        return CGSize(width:collectionView.bounds.width, height:itemsHeight)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        if index.item == 0 {
            return self.dequeueMenuCell(collectionView:collectionView, index:index)
        }
        return self.dequeueContentCell(collectionView:collectionView, index:index)
    }
}
