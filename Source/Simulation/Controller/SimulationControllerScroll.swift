import UIKit

class SimulationControllerScroll:NSObject, UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
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
            return collectionView.dequeueReusableCell(withReuseIdentifier:SimulationViewScroll.Constants.cellMenu,
                                                      for:index)
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier:SimulationViewScroll.Constants.cellContent,
                                                  for:index)
    }
}
