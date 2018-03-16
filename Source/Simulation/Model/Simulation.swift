import Foundation

class Simulation:Model {
    private(set) var project:Project?
    
    required init() {
        let viewModel:SimulationViewModel = SimulationViewModel()
        let controller:SimulationController = SimulationController()
        super.init(viewModel:viewModel, controller:controller)
        controller.model = self
    }
    
    override func controllerDidAppear() {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            self?.loadProject { [weak self] in
                self?.updateInterface()
            }
        }
    }
    
    func update(project:Project) {
        self.project = project
    }
    
    func loadProject(completion:@escaping(() -> ())) {
        let database:Database = Database()
        database.loadProfile { [weak self] (profile:Profile) in
            self?.update(project:profile.project)
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
        viewModel.update(project:project)
    }
}
