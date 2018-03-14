import Foundation

protocol SimulationViewModelMenuProtocol {
    var title:String { get }
    weak var project:Project? { get set }
    
    func factoryViewModel() -> SimulationViewModelContent
}
