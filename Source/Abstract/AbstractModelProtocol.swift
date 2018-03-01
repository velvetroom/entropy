import Foundation

internal protocol AbstractModelProtocol:AbstractModel {
    associatedtype ViewModel
    associatedtype ViewController:AbstractController<ViewModel>
    
    init()
}
