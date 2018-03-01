import Foundation

internal protocol AbstractViewModelProtocol:AnyObject {
    weak var delegate:ViewModelDelegate? { get }
    
    init()
}
