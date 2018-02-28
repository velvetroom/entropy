import Foundation

internal protocol AbstractSignature {
    associatedtype Model
    associatedtype Controller:AbstractController
    associatedtype ViewModel:AbstractViewModel
}
