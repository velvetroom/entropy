import Foundation

internal protocol AbstractSignature {
    associatedtype Model
    associatedtype Controller:AbstractController<ViewModel>
    associatedtype ViewModel
}
