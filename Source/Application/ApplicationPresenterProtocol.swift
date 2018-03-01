import UIKit

internal protocol ApplicationPresenterProtocol {
    weak var viewController:ApplicationViewController? { get }
    
    func present(model:AbstractModelProtocol, presentStrategy:PresentProtocol.Type)
}
