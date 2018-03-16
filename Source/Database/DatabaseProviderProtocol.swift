import Foundation

protocol DatabaseProviderProtocol {
    func loadProfile(found:@escaping((Profile) -> ()), notFound:@escaping(() -> ()))
    func createProfile(completion:@escaping((Profile) -> ()))
    func save(project:Project, completion:@escaping(() -> ()))
}
