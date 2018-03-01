import UIKit

internal class AbstractController:UIViewController {
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal final func savePresentLayout(layout:PresentLayout) {
        guard
            let view:AbstractView = self.view as? AbstractView
        else {
            return
        }
        view.layout = layout
    }
}
