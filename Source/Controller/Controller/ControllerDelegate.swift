import Foundation

internal protocol ControllerDelegate:AnyObject {
    init()
    func controllerDidLoad()
    func controllerDidAppear()
    func factoryViewModel<ConcreteViewModel>() -> ConcreteViewModel?
}
