import UIKit

internal final class ApplicationView:UIView {
    internal init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
