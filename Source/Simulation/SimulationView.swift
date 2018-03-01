import UIKit

internal final class SimulationView:AbstractView {
    internal override func factoryViews() {
        super.factoryViews()
        self.backgroundColor = UIColor.red
    }
}
