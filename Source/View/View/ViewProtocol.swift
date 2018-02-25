import UIKit

internal protocol ViewProtocol {
    var presentationLayout:PresentationLayout { get set }
    static func factoryView() -> UIView?
}
