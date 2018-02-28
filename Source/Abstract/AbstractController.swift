import Foundation

internal class AbstractController:AbstractControllerProtocol {
    internal weak var delegate:ControllerDelegate?
    
    internal required init() {
        
    }
}
