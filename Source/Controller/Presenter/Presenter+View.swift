import UIKit

internal extension Presenter {
    internal func addView(presentation:PresentationProtocol) {
        guard
            let view:UIView = presentation.model
        else {
            return
        }
        self.view.addSubview(view)
    }
}
