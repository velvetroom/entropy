import UIKit

internal class AbstractView:UIView {
    internal init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    internal func factoryViews() { }
}
