import Foundation

internal protocol AbstractViewModelProtocol {
    weak var delegate:ViewModelDelegate? { get }
    
    init()
}
