import Foundation

protocol AbstractViewModel:AnyObject {
    weak var delegate:ViewModelDelegate? { get set }
    
    init()
}
