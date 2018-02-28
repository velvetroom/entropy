import Foundation

internal protocol ControllerDelegate:AnyObject {
    var viewModel:AbstractViewModel { get }
}
