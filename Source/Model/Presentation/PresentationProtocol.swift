import UIKit

internal protocol PresentationProtocol {
    var controller:UIViewController? { get }
    var view:UIView? { get }
    var presentationStrategy:((Presenter) -> (PresentationProtocol) -> ()) { get }
}
