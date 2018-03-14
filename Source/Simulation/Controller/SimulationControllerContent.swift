import UIKit

class SimulationControllerContent:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout{
    weak var viewContent:SimulationViewContent? {
        didSet {
            self.viewContent?.delegate = self
            self.viewContent?.dataSource = self
        }
    }
    func collectionView(_:UICollectionView, numberOfItemsInSection:Int) -> Int {
        return  0
    }
    
    func collectionView(_:UICollectionView, cellForItemAt index:IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
