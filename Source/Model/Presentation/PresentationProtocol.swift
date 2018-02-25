import UIKit

internal protocol PresentationProtocol {
    var model:ModelProtocol { get }
    var controller:UIViewController? { get }
    var view:UIView? { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
    
    init(model:ModelProtocol)
}
