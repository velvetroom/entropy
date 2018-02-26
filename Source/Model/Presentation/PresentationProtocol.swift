import UIKit

internal protocol PresentationProtocol {
    associatedtype ConcreteController:ControllerProtocol
    
    var controller:UIViewController? { get }
    var view:UIView? { get }
    var model:Model<ConcreteController> { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
    
    init(model:Model<ConcreteController>)
}
