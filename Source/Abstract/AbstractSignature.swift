import Foundation

internal protocol AbstractSignature {
    associatedtype Controller:AbstractController
    associatedtype ViewModel:AbstractViewModel
}
