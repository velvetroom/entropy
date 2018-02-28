import Foundation

internal protocol AbstractController {
    weak var delegate:ControllerDelegate? { get }
}
