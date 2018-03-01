import Foundation

internal protocol AbstractModelProtocol:AbstractModel {
    associatedtype Controller:AbstractController<ViewModel>
    associatedtype ViewModel
    
    init()
}
