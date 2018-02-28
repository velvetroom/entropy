import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    internal let presenter:PresenterProtocol
    
    internal override init() {
        self.presenter = Presenter()
        super.init()
    }
    
    internal func startPresentation() {
        self.startWindow()
        let model:Simulation<ControllerSimulation, SimulationControllerDelegate, SimulationViewModel> = Simulation<ControllerSimulation, SimulationControllerDelegate, SimulationViewModel>()
        self.presenter.present(strategy:PresentationStrategyInitial.self, model:model)
    }
    
    private func startWindow() {
        self.window = Application.factoryWindow()
        self.window?.rootViewController = self.presenter.topController
    }
}
