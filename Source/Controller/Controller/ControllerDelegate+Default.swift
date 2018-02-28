import Foundation

internal extension ControllerDelegate {
    func controllerDidLoad() { }
    func controllerDidAppear() { }
    func factoryViewModel<ConcreteViewModel>() -> ConcreteViewModel? { }
}
