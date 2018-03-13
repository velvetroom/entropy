import UIKit

class SimulationControllerMenu:NSObject,
    UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var viewMenu:SimulationViewMenu? {
        didSet {
            self.viewMenu?.delegate = self
            self.viewMenu?.dataSource = self
        }
    }
    
    private(set) var viewModel:SimulationViewModelMenu
    
    override init() {
        self.viewModel = SimulationViewModelMenu()
        super.init()
    }
    
    func reloadMenu(viewModel:SimulationViewModelMenu) {
        self.viewModel = viewModel
        self.viewMenu?.reloadData()
        self.viewMenu?.selectItem(at:self.viewModel.selected, animated:false,
                                  scrollPosition:UICollectionViewScrollPosition.centeredHorizontally)
    }
    
    func selectedItem(index:IndexPath) {
        self.viewModel.selected = index
        if self.isScrollableToIndex(index:index.item) {
            self.viewMenu?.scrollToItem(at:index, at:UICollectionViewScrollPosition.centeredHorizontally, animated:true)
        }
    }
    
    func isScrollableToIndex(index:Int) -> Bool {
        guard
            let countItems:Int = self.viewMenu?.numberOfItems(inSection:0),
            countItems > index
        else {
            return false
        }
        return true
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:SimulationViewMenu.Constants.cellWidth, height:collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        insetForSectionAt:Int) -> UIEdgeInsets {
        let totalWidth:CGFloat = collectionView.bounds.width
        let remainWidth:CGFloat = totalWidth - SimulationViewMenu.Constants.cellWidth
        let margin:CGFloat = remainWidth / 2.0
        let insets:UIEdgeInsets = UIEdgeInsets(top:0, left:margin, bottom:0, right:margin)
        return insets
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.items.count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCell(collectionView:collectionView, index:index)
    }
    
    func collectionView(_ collectionView:UICollectionView, didSelectItemAt index:IndexPath) {
        self.selectedItem(index:index)
    }
    
    private func dequeueCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:SimulationViewMenu.Constants.cell, for:index)
        if let cell:SimulationViewMenuCell = cell as? SimulationViewMenuCell {
            self.configure(cell:cell, at:index)
        }
        return cell
    }
    
    private func configure(cell:SimulationViewMenuCell, at index:IndexPath) {
        let item:SimulationViewModelMenuProtocol = self.viewModel.items[index.item]
        cell.title?.text = item.title
    }
}
