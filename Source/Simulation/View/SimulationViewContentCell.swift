import UIKit

class SimulationViewContentCell:UICollectionViewCell {
    private(set) weak var viewModel:SimulationViewModelContentProtocol?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func update(viewModel:SimulationViewModelContentProtocol) {
        self.viewModel = viewModel
    }
}
