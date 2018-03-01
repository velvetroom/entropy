import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    private let presenter:ApplicationPresenter
    
    internal override init() {
        self.presenter = ApplicationPresenter()
        super.init()
    }
    
    internal func application(
        _:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        let model:AbstractModel = self.initialModel()
        let viewController:ApplicationViewController = ApplicationViewController()
        self.startPresentation(model:model, viewController:viewController)
        return true
    }
    
    private func initialModel() -> AbstractModel {
        return Simulation()
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
