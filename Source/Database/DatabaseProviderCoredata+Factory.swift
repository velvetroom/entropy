import Foundation
import CoreData

extension DatabaseProviderCoredata {
    class func factoryContext(bundle:Bundle) -> NSManagedObjectContext {
        let context:NSManagedObjectContext = NSManagedObjectContext(
            concurrencyType:NSManagedObjectContextConcurrencyType.privateQueueConcurrencyType)
        context.mergePolicy = NSMergePolicy(merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        assignStoreTo(context:context, in:bundle)
        return context
    }
    
    private class func assignStoreTo(context:NSManagedObjectContext, in bundle:Bundle) {
        guard
            let model:NSManagedObjectModel = factoryModel(),
            let store:NSPersistentStoreCoordinator = factoryStore(bundle:bundle, model:model)
        else {
            return
        }
        context.persistentStoreCoordinator = store
    }
    
    private class func factoryModel() -> NSManagedObjectModel? {
        guard
            let url:URL = Bundle.main.url(forResource:Constants.name, withExtension:Constants.type),
            let managedObjectModel:NSManagedObjectModel = NSManagedObjectModel(contentsOf:url)
        else {
            return nil
        }
        return managedObjectModel
    }
    
    private class func factoryStore(bundle:Bundle, model:NSManagedObjectModel) -> NSPersistentStoreCoordinator? {
        let url:URL = factoryStoreURL(bundle:bundle)
        let store:NSPersistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel:model)
        do {
            try store.addPersistentStore(ofType:NSSQLiteStoreType, configurationName:nil, at:url, options:nil)
        } catch {
            return nil
        }
        return store
    }
    
    private class func factoryStoreURL(bundle:Bundle) -> URL {
        let sqliteFile:String = factorySqliteFile(bundle:bundle)
        let url:URL = FileManager.default.applicationDirectory.appendingPathComponent(sqliteFile)
        return url
    }
    
    private class func factorySqliteFile(bundle:Bundle) -> String {
        var sqliteFile:String = factoryIdentifier(bundle:bundle)
        sqliteFile.append(".")
        sqliteFile.append(Constants.name)
        sqliteFile.append(".")
        sqliteFile.append(Constants.sqliteExtension)
        return sqliteFile
    }
    
    private class func factoryIdentifier(bundle:Bundle) -> String {
        guard
            let identifier:String = bundle.bundleIdentifier
        else {
            return String()
        }
        return identifier
    }
}
