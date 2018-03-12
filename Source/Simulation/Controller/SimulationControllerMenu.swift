import UIKit

class SimulationControllerMenu:NSObject,
    UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var viewModel:[SimulationViewModelMenuProtocol]
    
    override init() {
        self.viewModel = []
        super.init()
    }
    
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return self.viewModel.count
    }
    
    func collectionView(_ collectionView:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier:SimulationViewMenu.Constants.cell, for:index)
    }
}
