import Foundation

extension String {
    private struct Constants {
        static let tableCoredata:String = "LocalizableCoredata"
        static let tableSimulation:String = "LocalizableSimulation"
    }
    
    static func localizedCoredata(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableCoredata, comment:String())
    }
    
    static func localizedSimulation(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableSimulation, comment:String())
    }
}
