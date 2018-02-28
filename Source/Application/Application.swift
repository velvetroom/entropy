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
        self.startWindow()
        self.presenter.startPresentation()
        return true
    }
    
    private func startWindow() {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.sharedBackgroundColour
        window.makeKeyAndVisible()
        self.window = window
    }
}
