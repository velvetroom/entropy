import UIKit

internal extension Application {
    internal func startPresentation() {
        self.window = Application.factoryWindow()
        self.window?.rootViewController = self.presenter
    }
    
    internal func factoryInitialPresentation() {
        
    }
}
