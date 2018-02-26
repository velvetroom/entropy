import UIKit

internal extension Application {
    internal class func factoryWindow() -> UIWindow {
        let window:UIWindow = UIWindow(frame:UIScreen.main.bounds)
        window.backgroundColor = UIColor.sharedBackgroundColour
        window.makeKeyAndVisible()
        return  window
    }
}
