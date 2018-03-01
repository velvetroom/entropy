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
        let controller:ApplicationController = ApplicationController()
        self.startPresentation(model:model, controller:controller)
        return true
    }
    
    private func startPresentation(model:AbstractModel, controller:ApplicationController) {
        self.startWindow(controller:controller)
        self.presenter.controller = controller
        self.presenter.present(model:model, presentStrategy:PresentCentred.self)
    }
    
    private func startWindow(controller:ApplicationController) {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.sharedBackgroundColour
        window.makeKeyAndVisible()
        window.rootViewController = controller
        self.window = window
    }
}
