import UIKit

internal final class Presenter:UIViewController, PresenterProtocol {
    internal var models:[AnyObject]
    internal var orientation:UIInterfaceOrientationMask
    internal let privateQueue:DispatchQueue
    
    internal init() {
        self.models = []
        self.orientation = UIInterfaceOrientationMask.portrait
        self.privateQueue = Presenter.factoryPrivateQueue()
        super.init(nibName:nil, bundle:nil)
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    internal override func loadView() {
        let viewPresenter:ViewPresenter = ViewPresenter()
        self.view = viewPresenter
    }
}
