import Foundation

protocol SimulationViewModelMenuProtocol {
    var title:String { get }
    
    func factoryViewModel() -> SimulationViewModelContent
}
