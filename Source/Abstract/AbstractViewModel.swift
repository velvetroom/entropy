import Foundation

internal class AbstractViewModel:AbstractViewModelProtocol {
    internal weak var delegate:ViewModelDelegate?
    
    internal required init() {
        
    }
}
