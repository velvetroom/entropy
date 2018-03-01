import UIKit

internal class AbstractView:UIView {
    internal var layout:PresentLayout
    
    internal init() {
        self.layout = PresentLayout()
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.factoryViews()
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    internal func factoryViews() { }
}
