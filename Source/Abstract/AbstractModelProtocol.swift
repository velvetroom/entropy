import Foundation

internal protocol AbstractModelProtocol:AbstractModel {
    associatedtype ViewModel
    associatedtype Controller:AbstractController<ViewModel>
    
    init()
}
