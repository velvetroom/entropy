import UIKit

internal final class ApplicationController:UIViewController {
    override func loadView() {
        let view:ApplicationView = ApplicationView()
        self.view = view
    }
}
