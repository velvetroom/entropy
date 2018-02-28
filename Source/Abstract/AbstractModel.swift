import Foundation

internal class AbstractModel<SpecialisedSignature:AbstractSignature>:AbstractModelProtocol, ControllerDelegate {
    typealias Signature = SpecialisedSignature
}
