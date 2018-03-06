import Foundation

internal protocol ControllerDelegate:AnyObject {
    func controllerDidLoad()
    func controllerWillAppear()
    func controllerDidAppear()
}
