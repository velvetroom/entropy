import Foundation

internal protocol ControllerProtocol:AnyObject {
    associatedtype SpecialisedProtocol
    associatedtype SpecialisedView:View
    weak var delegate:ControllerDelegate? { get set }
    weak var viewSpecialised:SpecialisedView? { get }
    
    init()
}
