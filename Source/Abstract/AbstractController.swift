import UIKit

internal class AbstractController:UIViewController {
    internal weak var delegate:ControllerDelegate?
    
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
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.controllerDidLoad()
    }
    
    internal override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.delegate?.controllerWillAppear()
    }
    
    internal override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate?.controllerDidAppear()
    }
}
