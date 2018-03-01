import UIKit

internal protocol AbstractModel:ViewModelDelegate {
    var viewModel:AbstractViewModelProtocol { get set }
    var controller:UIViewController { get set }
}
