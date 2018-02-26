import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    internal let presenter:PresenterProtocol
    
    override init() {
        self.presenter = Presenter()
        super.init()
    }
    
    internal func startPresentation() {
        self.startWindow()
        let model:ModelSimulation<ControllerSimulation> = ModelSimulation<ControllerSimulation>()
        self.presenter.present(strategy:PresentationStrategyInitial.self, model:model)
    }
    
    private func startWindow() {
        self.window = Application.factoryWindow()
        self.window?.rootViewController = self.presenter as? UIViewController
    }
}
