import UIKit

class SimulationControllerContent:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{
    weak var viewContent:SimulationViewContent? {
        didSet {
            self.viewContent?.delegate = self
            self.viewContent?.dataSource = self
        }
    }
    
    private(set) weak var viewModel:SimulationViewModel?
    
    func reloadContent(viewModel:SimulationViewModel) {
        self.viewModel = viewModel
        self.viewContent?.reloadData()
    }
    
    func dequeueCell(collectionView:UICollectionView, index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        guard
            let count:Int = self.viewModel?.content.items.count
        else {
            return 0
        }
        return  count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return self.dequeueCell(collectionView:collectionView, index:index)
    }
}
