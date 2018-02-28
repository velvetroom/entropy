import Foundation

internal protocol AbstractSignature {
    associatedtype Signature:AbstractSignature
    associatedtype Model:AbstractModel
    associatedtype Controller:AbstractController
    associatedtype ViewModel:AbstractViewModel
}
