import Foundation

internal final class Simulation<
    ConcreteController:ControllerProtocol,
    ConcreteControllerDelegate:ControllerDelegate,
    ConcreteViewModel:ViewModelProtocol>:Model<ConcreteController, ConcreteControllerDelegate, ConcreteViewModel> {
}
