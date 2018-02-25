import UIKit

internal protocol PresentationProtocol {
    var model:ModelProtocol { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
    
    init(model:ModelProtocol)
}
