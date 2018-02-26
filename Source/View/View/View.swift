import UIKit

internal class View:UIView {
    internal var presentationLayout:PresentationLayout
    
    internal required init() {
        self.presentationLayout = PresentationLayout()
        super.init(frame:CGRect.zero)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
