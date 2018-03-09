import UIKit

class ApplicationController:UIViewController {
    override func loadView() {
        let view:ApplicationView = ApplicationView()
        self.view = view
    }
}
