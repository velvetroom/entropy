import Foundation

internal protocol ViewProtocol {
    associatedtype SpecialisedModel
    var model:SpecialisedModel? { get }
    
    init(model:SpecialisedModel)
}
