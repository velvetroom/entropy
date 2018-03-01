import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    private let presenter:ApplicationPresenter
    private let initialModelType:AbstractModel.Type
    
    internal override init() {
        self.presenter = ApplicationPresenter()
        self.initialModelType = Simulation.self
        super.init()
    }
    
    internal func application(
        _:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        let model:AbstractModel = self.initialModelType.init()
        let viewController:ApplicationViewController = ApplicationViewController()
        self.startPresentation(model:model, viewController:viewController)
        return true
    }
    
    private func startPresentation(model:AbstractModel, viewController:ApplicationViewController) {
        self.startWindow(viewController:viewController)
        self.presenter.viewController = viewController
        self.presenter.present(model:model, presentStrategy:PresentCentred.self)
    }
    
    private func startWindow(viewController:ApplicationViewController) {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.sharedBackgroundColour
        window.makeKeyAndVisible()
        window.rootViewController = viewController
        self.window = window
    }
}
