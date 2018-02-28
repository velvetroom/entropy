import Foundation

internal protocol ControllerProtocol:AnyObject {
    associatedtype SpecialisedProtocol
    associatedtype SpecialisedView:View where SpecialisedView:ViewProtocol
    associatedtype SpecialisedControllerDelegate:ControllerDelegate
    weak var delegate:SpecialisedControllerDelegate? { get set }
    weak var viewSpecialised:SpecialisedView? { get }
    
    init()
}
