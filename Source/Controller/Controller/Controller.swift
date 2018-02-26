import UIKit

internal class Controller<ConcreteView:View>:UIViewController {
    internal weak var delegate:ControllerDelegate?
    
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
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
    
    internal override func loadView() {
        let view:ConcreteView = ConcreteView()
        self.view = view
        self.delegate?.controllerLoadView()
    }
}
