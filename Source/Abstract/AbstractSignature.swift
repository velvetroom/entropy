import Foundation

internal protocol AbstractSignature {
    associatedtype Model:AbstractModel
    associatedtype Controller:AbstractController
    associatedtype View:AbstractView
    associatedtype ViewModel:AbstractViewModel
}
