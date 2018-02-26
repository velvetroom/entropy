import Foundation

internal protocol ControllerDelegate:AnyObject {
    func controllerDidLoad()
    func controllerDidAppear()
    func modelForView<ConcreteModel>() -> ConcreteModel?
}
