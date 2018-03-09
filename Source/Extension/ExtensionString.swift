import Foundation

extension String {
    private struct Constants {
        static let tableCoredata:String = "LocalizableCoredata"
    }
    
    static func localizedCoredata(key:String) -> String {
        return NSLocalizedString(key, tableName:Constants.tableCoredata, comment:String())
    }
}
