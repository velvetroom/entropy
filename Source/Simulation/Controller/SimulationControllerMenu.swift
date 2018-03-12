import UIKit

class SimulationControllerMenu:NSObject,
    UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var viewModel:[SimulationViewModelMenuProtocol] {
        didSet {
            self.viewMenu?.reloadData()
        }
    }
    
    weak var viewMenu:SimulationViewMenu? {
        didSet {
            self.viewMenu?.delegate = self
            self.viewMenu?.dataSource = self
            self.viewMenu?.reloadData()
        }
    }
    
    override init() {
        self.viewModel = []
        super.init()
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt:IndexPath) -> CGSize {
        return CGSize(width:SimulationViewMenu.Constants.cellWidth, height:collectionView.bounds.height)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCell(collectionView:collectionView, index:index)
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
        let item:SimulationViewModelMenuProtocol = self.viewModel[index.item]
        cell.title?.text = item.title
    }
}
