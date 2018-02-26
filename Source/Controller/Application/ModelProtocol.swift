import Foundation

internal protocol ModelProtocol {
    associatedtype SpecialisedControllerProtocol:ControllerProtocol
    var controller:SpecialisedControllerProtocol { get }
}
