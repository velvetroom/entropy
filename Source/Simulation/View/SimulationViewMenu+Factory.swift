import UIKit

extension SimulationViewMenu {
    class func factoryLayout() -> UICollectionViewFlowLayout {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.headerReferenceSize = CGSize.zero
        layout.footerReferenceSize = CGSize.zero
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets.zero
        return layout
    }
}
