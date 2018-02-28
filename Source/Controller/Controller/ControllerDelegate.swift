import Foundation

internal protocol ControllerDelegate:AnyObject {
    weak var viewModel:ViewModelProtocol? { get set }
    
    init()
    func controllerDidLoad()
    func controllerDidAppear()
}
