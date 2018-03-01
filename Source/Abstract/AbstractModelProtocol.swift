import Foundation

internal protocol AbstractModelProtocol:AbstractModel {
    associatedtype ViewModel
    associatedtype ViewController:AbstractViewController<ViewModel>
    
    init()
}
