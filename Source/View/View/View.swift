import UIKit

internal class View<ConcreteViewModel:ViewModelProtocol>:UIView, ViewProtocol {
    internal typealias SpecialisedViewModel = ConcreteViewModel
    internal weak var viewModel:ConcreteViewModel?
    internal var presentationLayout:PresentationLayout?
    
    internal required init() {
        super.init(frame:CGRect.zero)
        self.configureViewDefaults()
    }
    
    internal required init?(coder:NSCoder) {
        return nil
    }
    
    private func configureViewDefaults() {
        self.clipsToBounds = true
        self.backgroundColor = UIColor.sharedBackgroundColour
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    internal func factoryViews() { }
}
