import UIKit

internal protocol ApplicationPresenterProtocol {
    weak var window:UIWindow? { get set }
    
    func present<ConcreteSignature:AbstractSignature>(signature:ConcreteSignature)
}
