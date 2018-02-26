import UIKit

internal class View:UIView {
    internal var presentationLayout:PresentationLayout?
    
    internal required init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.red
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
