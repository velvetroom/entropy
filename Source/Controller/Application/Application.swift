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
        let presentationStrategy:PresentationStrategyInitial = PresentationStrategyInitial()
        self.presenter.present(strategy:presentationStrategy, model:model)
    }
    
    private func startWindow() {
        self.window = Application.factoryWindow()
        self.window?.rootViewController = self.presenter as? UIViewController
    }
}
