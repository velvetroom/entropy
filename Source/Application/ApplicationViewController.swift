import UIKit

internal final class ApplicationViewController:UIViewController {
    override func loadView() {
        let view:ApplicationView = ApplicationView()
        self.view = view
    }
}
