import Foundation

internal protocol AbstractControllerProtocol {
    associatedtype SpecialisedViewModel
    associatedtype SpecialisedViewController:AbstractViewController<SpecialisedViewModel>
    weak var delegate:ControllerDelegate? { get }
    var viewController:SpecialisedViewController { get }
    
    init(viewController:SpecialisedViewController)
}
