import UIKit

internal class Controller<
    ConcreteControllerDelegate:ControllerDelegate,
    ConcreteView:View>:UIViewController where ConcreteView:ViewProtocol {
    internal weak var delegate:ConcreteControllerDelegate?
    internal weak var viewSpecialised:ConcreteView?
    
    internal init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
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
        guard
            let viewModel:ViewModelProtocol = self.delegate?.viewModel
        else {
            return
        }
        let view = ConcreteView(viewModel: <#T##ViewModelProtocol#>)
        self.view = view
        self.viewSpecialised = view
    }
}
