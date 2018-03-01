import UIKit

internal protocol AbstractModel:ViewModelDelegate {
    var viewModel:AbstractViewModelProtocol { get set }
    var viewController:UIViewController { get set }
}
