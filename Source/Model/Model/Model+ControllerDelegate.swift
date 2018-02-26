import Foundation

internal extension Model {
    internal func controllerDidLoad() { }
    
    internal func controllerDidAppear() { }
    
    internal func modelForView<ConcreteModel>() -> ConcreteModel? {
        return self as? ConcreteModel
    }
}
