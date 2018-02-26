import UIKit

internal class View:UIView {
    internal var presentationLayout:PresentationLayout?
    
    internal init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal func factoryViews() { }
}
