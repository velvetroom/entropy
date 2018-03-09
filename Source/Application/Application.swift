import UIKit

@UIApplicationMain
class Application:UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    private let presenter:ApplicationPresenter
    private let initialModelType:Model.Type
    
    override init() {
        self.presenter = ApplicationPresenter()
        self.initialModelType = Simulation.self
        super.init()
    }
    
    func application(_:UIApplication, didFinishLaunchingWithOptions:[UIApplicationLaunchOptionsKey:Any]?) -> Bool {
        let model:Model = self.initialModelType.init()
        let controller:ApplicationController = ApplicationController()
        self.startPresentation(model:model, controller:controller)
        return true
    }
    
    private func startPresentation(model:Model, controller:ApplicationController) {
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
