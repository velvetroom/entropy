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
        self.window = Application.factoryWindow()
        self.window?.rootViewController = self.presenter as? UIViewController
    }
    
    internal func factoryInitialPresentation() {
        
    }
    
}
