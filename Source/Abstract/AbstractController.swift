import UIKit

class AbstractController:UIViewController {
    weak var delegate:ControllerDelegate?
    
    init() {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder) {
        return nil
    }
    
    func savePresentLayout(layout:PresentLayout) {
        guard
            let view:AbstractView = self.view as? AbstractView
        else {
            return
        }
        view.layout = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate?.controllerDidLoad()
        self.configureEdgeLayouts()
    }
    
    private func configureEdgeLayouts() {
        self.edgesForExtendedLayout = UIRectEdge()
        self.extendedLayoutIncludesOpaqueBars = false
        if #available(iOS 11.0, *) {
            self.additionalSafeAreaInsets = UIEdgeInsets.zero
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
        self.delegate?.controllerWillAppear()
    }
    
    override func viewDidAppear(_ animated:Bool) {
        super.viewDidAppear(animated)
        self.delegate?.controllerDidAppear()
    }
    
    func reloadViewModel() { }
}
