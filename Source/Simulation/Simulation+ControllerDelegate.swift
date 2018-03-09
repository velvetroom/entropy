import Foundation

extension Simulation {
    func controllerDidAppear() {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadProject { [weak self] in
                self?.updateViewModel()
            }
        }
    }
}
