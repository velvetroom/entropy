import UIKit

internal class Controller:UIViewController {
    internal weak var delegate:ControllerDelegate?
    
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder){
        return nil
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.controllerDidLoad()
    }
    
    internal override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate?.controllerDidAppear()
    }
}
