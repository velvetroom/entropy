import Foundation

internal final class Simulation<
    ConcreteController:ControllerProtocol,
    ConcreteControllerDelegate:ControllerDelegate,
    ConcreteViewModel:ViewModelProtocol>:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel> {
    internal func shite() {
        print("this is shite")
    }
}
