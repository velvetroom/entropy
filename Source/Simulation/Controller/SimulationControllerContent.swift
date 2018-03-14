import UIKit

class SimulationControllerContent:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return  0
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
