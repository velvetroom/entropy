import Foundation

internal protocol ControllerProtocol {
    associatedtype SpecialisedProtocol
    weak var delegate:ControllerDelegate? { get }
    
    init()
}
