import Foundation

internal protocol AbstractSignature {
    associatedtype Model
    associatedtype ViewModel
    associatedtype ViewController
    associatedtype Controller:AbstractController<ViewModel, ViewController>
}
