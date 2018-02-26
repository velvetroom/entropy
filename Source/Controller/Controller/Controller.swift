import UIKit

internal class Controller:UIViewController {
    internal weak var delegate:ControllerDelegate?
    
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder){
        return nil
    }
}
