import Foundation

extension Simulation {
    func saveProject(completion:@escaping(() -> ())) {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async { [weak self] in
            guard
                let project:Project = self?.project
            else {
                return
            }
            self?.save(project:project, completion:completion)
        }
    }
    
    private func save(project:Project, completion:@escaping(() -> ())) {
        let database:Database = Database()
        database.save(project:project) {
            DispatchQueue.main.async {
                completion()
            }
        }
    }
}
