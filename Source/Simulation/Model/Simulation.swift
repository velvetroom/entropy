import Foundation

class Simulation:Model {
    private(set) var project:Project?
    
    required init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        super.init(viewModel:viewModel, controller:controller)
    }
    
    override func controllerDidAppear() {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadProject { [weak self] in
                self?.updateInterface()
            }
        }
    }
    
    func loadProject(completion:@escaping(() -> ())) {
        let database:Database = Database()
        database.loadProfile { [weak self] (profile:Profile) in
            self?.project = profile.project
            completion()
        }
    }
    
    private func updateInterface() {
        self.updateViewModel()
        DispatchQueue.main.async { [weak self] in
            self?.controller.reloadViewModel()
        }
    }
    
    private func updateViewModel() {
        guard
            let project:Project = self.project,
            let viewModel:SimulationViewModel = self.viewModel as? SimulationViewModel
        else {
            return
        }
        viewModel.updateGraph(entropy:project.entropy)
    }
}
