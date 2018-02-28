import UIKit

internal class Controller<
    ConcreteControllerProtocol:ControllerProtocol,
    ConcreteControllerDelegate:ControllerDelegate,
    ConcreteView:ViewProtocol>:UIViewController, ConcreteControllerProtocol {
    internal typealias SpecialisedProtocol = ConcreteControllerProtocol
    internal typealias SpecialisedControllerDelegate = ConcreteControllerDelegate
    internal typealias SpecialisedViewModel = ConcreteControllerDelegate.soeSpecialisedViewModel
    internal typealias SpecialisedView = ConcreteView
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
//        let view = ConcreteView(viewModel: <#T##ViewModelProtocol#>)
//        self.view = view
//        self.viewSpecialised = view
    }
}
