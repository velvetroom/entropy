import UIKit

class SimulationViewMenuCell:UICollectionViewCell {
    private(set) weak var title:UILabel?
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.clear
        
        let title:UILabel = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.isUserInteractionEnabled = false
        title.backgroundColor = UIColor.clear
        title.font = UIFont.systemFont(ofSize:Constants.fontSize, weight:UIFont.Weight.light)
        title.textAlignment = NSTextAlignment.center
        title.textColor = UIColor.black
        self.title = title
        
        self.addSubview(title)
        
        title.layoutEquals(view:self)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
