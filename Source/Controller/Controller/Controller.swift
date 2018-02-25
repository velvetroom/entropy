import UIKit

internal class Controller<SpecialisedArchitecture>:UIViewController, ControllerProtocol,
    ArchitectureMember where SpecialisedArchitecture:Architecture {
    internal typealias GenericArchitecture = SpecialisedArchitecture
    internal weak var delegate:ControllerDelegate?
    
    internal required init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.controllerDidLoad()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate?.controllerDidAppear()
    }
    
    internal override func loadView() {
        self.view = GenericArchitecture.GenericView.factoryView()
    }
}
