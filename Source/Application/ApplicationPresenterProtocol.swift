import UIKit

internal protocol ApplicationPresenterProtocol {
    weak var viewController:ApplicationViewController? { get }
    
    func present<ConcreteSignature>(model:AbstractModel<ConcreteSignature>, presentStrategy:PresentProtocol.Type)
}
