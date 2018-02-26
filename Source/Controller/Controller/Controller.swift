import UIKit

internal class Controller<ConcreteView:View>:UIViewController where ConcreteView:ViewProtocol {
    internal weak var delegate:ControllerDelegate?
    internal weak var viewSpecialised:ConcreteView?
    
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
        guard
            let model:ConcreteView.SpecialisedModel = self.delegate?.modelForView()
        else {
            return
        }
        let view:ConcreteView = ConcreteView(model:model)
        self.view = view
        self.viewSpecialised = view
    }
}
