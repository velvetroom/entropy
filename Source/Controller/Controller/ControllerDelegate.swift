import Foundation

internal protocol ControllerDelegate:AnyObject {
    func controllerDidLoad()
    func controllerDidAppear()
    func controllerLoadView()
}
