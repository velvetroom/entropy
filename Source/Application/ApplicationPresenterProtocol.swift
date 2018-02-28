import UIKit

internal protocol ApplicationPresenterProtocol {
    weak var viewController:ApplicationViewController? { get }
    
    func present<SpecialisedSignature>(model:AbstractModel<SpecialisedSignature>, presentStrategy:PresentProtocol.Type)
}
