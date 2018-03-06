import Foundation

internal protocol AbstractViewModel:AnyObject {
    weak var delegate:ViewModelDelegate? { get set }
    
    init()
}
