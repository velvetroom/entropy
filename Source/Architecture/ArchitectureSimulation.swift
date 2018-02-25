import Foundation

internal struct ArchitectureSimulation:Architecture {
    internal typealias GenericModel = ModelSimulation
    internal typealias GenericView = ViewSimulation
    internal typealias GenericController = ControllerSimulation
}
