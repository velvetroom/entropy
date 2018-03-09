import UIKit

class AbstractView:UIView {
    var layout:PresentLayout
    
    init() {
        self.layout = PresentLayout()
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func factoryViews() { }
}
