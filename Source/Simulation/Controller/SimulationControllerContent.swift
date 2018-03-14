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
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        guard
            let count:Int = self.viewModel?.content.items.count
        else {
            return 0
        }
        return  count
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
