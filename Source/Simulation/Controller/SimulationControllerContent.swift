import UIKit

class SimulationControllerContent:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    weak var model:Simulation? {
        didSet {
            self.projectName.model = self.model
        }
    }
    weak var viewContent:SimulationViewContent? {
        didSet {
            self.viewContent?.delegate = self
            self.viewContent?.dataSource = self
        }
    }
    
    private(set) weak var viewModel:SimulationViewModel?
    let projectName:SimulationControllerContentProjectName
    
    override init() {
        self.projectName = SimulationControllerContentProjectName()
        super.init()
    }
    
    func reloadContent(viewModel:SimulationViewModel) {
        self.viewModel = viewModel
        self.viewContent?.reloadData()
    }
    
    func dequeueCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        guard
            let contentItem:SimulationViewModelContentProtocol = self.viewModel?.content.items[index.item]
        else {
            return UICollectionViewCell()
        }
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:contentItem.cellIdentifier, for:index)
        if let cellContent:SimulationViewContentCell = cell as? SimulationViewContentCell {
            cellContent.update(viewModel:contentItem, controller:self)
        }
        return cell
    }
    
    func collectionView(_ collectionView:UICollectionView, layout:UICollectionViewLayout,
                        sizeForItemAt index:IndexPath) -> CGSize {
        guard
            let contentItem:SimulationViewModelContentProtocol = self.viewModel?.content.items[index.item]
        else {
            return CGSize.zero
        }
        return CGSize(width:collectionView.bounds.width, height:contentItem.cellHeight)
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        guard
            let count:Int = self.viewModel?.content.items.count
        else {
            return 0
        }
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCell(collectionView:collectionView, index:index)
    }
}
