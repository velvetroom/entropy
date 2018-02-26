import Foundation

internal extension Application {
    internal class func factoryPresenter() -> Presenter {
        let presenter:Presenter = Presenter()
        return presenter
    }
}
