import UIKit

class ApplicationView:UIView {
    init() {
        super.init(frame:CGRect.zero)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
}
