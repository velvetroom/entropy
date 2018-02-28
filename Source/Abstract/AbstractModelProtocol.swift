import Foundation

internal protocol AbstractModelProtocol {
    associatedtype Signature:AbstractSignature
    var controller:Signature.Controller { get }
    var viewModel:Signature.ViewModel { get }
}
