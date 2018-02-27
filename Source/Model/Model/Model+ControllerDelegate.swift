import Foundation

internal extension Model {
    internal func controllerDidLoad() { }
    
    internal func controllerDidAppear() { }
    
    internal func factoryViewModel<ConcreteViewModel>() -> ConcreteViewModel? {
        return self as? ConcreteViewModel
    }
}
