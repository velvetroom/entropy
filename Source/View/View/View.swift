import UIKit

internal class View:UIView {
    internal weak var datasource:ModelDatasource?
    internal weak var delegate:ViewDelegate?
    internal var presentationLayout:PresentationLayout?
    
    internal required init() {
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
