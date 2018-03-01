import Foundation

internal protocol AbstractModelProtocol:AbstractModel {
    associatedtype ViewModel:AbstractViewModelProtocol
    associatedtype Controller:AbstractControllerPrototype
}
