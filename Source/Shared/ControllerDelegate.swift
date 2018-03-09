import Foundation

protocol ControllerDelegate:AnyObject {
    func controllerDidLoad()
    func controllerWillAppear()
    func controllerDidAppear()
}
