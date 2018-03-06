import Foundation

internal protocol ApplicationPresenterProtocol {
    weak var controller:ApplicationController? { get }
    
    func present(model:AbstractModel, presentStrategy:PresentProtocol.Type)
}
