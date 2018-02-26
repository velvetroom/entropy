import Foundation

internal protocol ViewProtocol {
    associatedtype SpecialisedModel
    var model:SpecialisedModel? { get set }
    
    init()
    init(model:SpecialisedModel)
    func factoryViews()
}
