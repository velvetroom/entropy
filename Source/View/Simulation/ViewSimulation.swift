import UIKit

internal final class ViewSimulation:View<ArchitectureSimulation> {
    internal override func factoryViews() {
        super.factoryViews()
        self.backgroundColor = UIColor.red
    }
}
