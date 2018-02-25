import UIKit

internal extension ViewProtocol {
    static func factoryView() -> UIView? {
        let type:UIView.Type? = self as? UIView.Type
        return type?.init()
    }
}
