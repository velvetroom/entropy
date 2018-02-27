import Foundation

internal protocol ViewProtocol {
    associatedtype ConcreteModel:AnyObject
    weak var model:ConcreteModel? { get set }
    
    init()
    init(model:ConcreteModel)
    func factoryViews()
}
