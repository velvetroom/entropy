import UIKit

internal protocol ControllerProtocol {
    weak var delegate:ControllerDelegate? { get set }
    init()
}
