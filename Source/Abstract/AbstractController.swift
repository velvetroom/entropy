import UIKit

internal class AbstractController:UIViewController {
    internal required init(viewModel:AbstractViewModel) {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
}
