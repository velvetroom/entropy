import Foundation

internal class AbstractModel<SpecialisedSignature:AbstractSignature>:
AbstractModelProtocol, ControllerDelegate, ViewModelDelegate {
    internal typealias Signature = SpecialisedSignature
    internal let controller:SpecialisedSignature.Controller
    internal let viewModel:AbstractViewModel
    
    internal init() {
        self.controller = SpecialisedSignature.Controller(
        self.viewModel = SpecialisedSignature.ViewModel()
        self.assignReferences()
    }
    
    private func assignReferences() {
        self.controller.delegate = self
        self.viewModel.delegate = self
    }
}
