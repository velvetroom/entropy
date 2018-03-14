import Foundation

protocol SimulationViewModelMenuProtocol:AnyObject {
    var title:String { get }
    weak var project:Project? { get set }
    
    func factoryViewModel() -> SimulationViewModelContent
}
