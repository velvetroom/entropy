import Foundation

internal protocol ControllerProtocol:AnyObject {
    associatedtype SpecialisedDelegate:ControllerDelegate
    associatedtype SpecialisedViewModel:ViewModelProtocol
    associatedtype SpecialisedView:ViewProtocol
    weak var delegate:SpecialisedDelegate? { get set }
    weak var viewSpecialised:SpecialisedView? { get }
    
    init()
}
