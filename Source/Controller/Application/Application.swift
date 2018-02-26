import UIKit

@UIApplicationMain
internal final class Application:UIResponder, UIApplicationDelegate {
    internal var window:UIWindow?
    internal let presenter:Presenter
    
    override init() {
        self.presenter = Presenter()
        super.init()
    }
    
//    internal func startPresentation() {
//        let presenter:Presenter = Application.factoryPresenter()
//        let initialPresentation:PresentationProtocol = Application.factoryInitialPresentation()
//        self.window = Application.factoryWindow()
//        self.window?.rootViewController = presenter
//        presenter.present(presentation:initialPresentation)
//    }
    
    
}
