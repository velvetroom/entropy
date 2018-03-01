import UIKit

internal class AbstractController:UIViewController {
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
