import Foundation
import CoreData

class DatabaseProviderCoredata:DatabaseProviderProtocol {
    private let context:NSManagedObjectContext
    
    init(bundle:Bundle = Bundle.main) {
        self.context = DatabaseProviderCoredata.factoryContext(bundle:bundle)
    }
    
    func create<Entity:NSManagedObject>(completion:@escaping((Entity) -> ())) {
        self.context.perform {
            guard
                let description:NSEntityDescription = NSEntityDescription.entity(forEntityName:Entity.name,
                                                                                 in:self.context),
                let entity:Entity = NSManagedObject(entity:description, insertInto:self.context) as? Entity
            else {
                return
            }
            completion(entity)
        }
    }
    
    func load<Entity:NSManagedObject>(request:NSFetchRequest<Entity>, completion:@escaping(([Entity]) -> ())) {
        self.context.perform {
            let data:[NSManagedObject]
            do {
                data = try self.context.fetch(request)
            } catch {
                return
            }
            if let results:[Entity] = data as? [Entity] {
                completion(results)
            }
        }
    }
    
    func delete(entity:NSManagedObject, completion:@escaping(() -> ())) {
        self.context.perform {
            self.context.delete(entity)
            completion()
        }
    }
    
    func deleteAll<Entity:NSManagedObject>(entityType:Entity.Type, completion:@escaping(() -> ())) {
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName:entityType.name)
        let batchDelete:NSBatchDeleteRequest = NSBatchDeleteRequest(fetchRequest:request)
        self.context.perform {
            do {
                try self.context.execute(batchDelete)
            } catch {
                return
            }
            completion()
        }
    }
    
    func save(completion:@escaping(() -> ())) {
        guard
            self.context.hasChanges == true
        else {
            completion()
            return
        }
        self.context.perform {
            do {
                try self.context.save()
            } catch let error {
                assertionFailure(error.localizedDescription)
            }
            completion()
        }
    }
}
