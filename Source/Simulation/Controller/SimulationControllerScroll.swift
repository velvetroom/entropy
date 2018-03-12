import UIKit

class SimulationControllerScroll:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    weak var viewModel:SimulationViewModel? {
        didSet {
            guard
                let viewModel:SimulationViewModel = self.viewModel
            else {
                return
            }
            self.menu.viewModel = viewModel.menu
        }
    }
    
    private let menu:SimulationControllerMenu
    
    override init() {
        self.menu = SimulationControllerMenu()
        super.init()
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt index:IndexPath) -> CGSize {
        if index.item == 0 {
            return CGSize(width:collectionView.bounds.width, height:SimulationView.Constants.menuHeight)
        }
        let usedHeight:CGFloat = SimulationView.Constants.menuHeight + SimulationView.Constants.graphHeight
        let remainHeight:CGFloat = collectionView.bounds.height - usedHeight
        return CGSize(width:collectionView.bounds.width, height:remainHeight)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        if index.item == 0 {
            return self.dequeueMenuCell(collectionView:collectionView, index:index)
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier:SimulationViewScroll.Constants.cellContent,
                                                  for:index)
    }
    
    private func dequeueMenuCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:SimulationViewScroll.Constants.cellMenu, for:index)
        if let cellMenu:SimulationViewScrollMenu = cell as? SimulationViewScrollMenu {
            self.menu.viewMenu = cellMenu.viewMenu
        }
        return cell
    }
}
