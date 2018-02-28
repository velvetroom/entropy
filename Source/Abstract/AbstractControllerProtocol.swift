import Foundation

internal protocol AbstractControllerProtocol {
    weak var delegate:ControllerDelegate? { get }
}
