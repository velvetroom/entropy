import Foundation

internal extension String {
    private struct Constants {
        fileprivate static let tableCoredata:String = "LocalizableCoredata"
    }
    
    static func localizedCoredata(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableCoredata, comment:String())
    }
}
