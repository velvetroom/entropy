import Foundation

protocol SimulationViewModelMenuProtocol:AnyObject {
    var title:String { get }
    weak var project:Project? { get }
    
    func factoryViewModel() -> SimulationViewModelContent
    func update(project:Project)
}
