import Foundation

internal extension Presenter {
    internal class func factoryPrivateQueue() -> DispatchQueue {
        let dispatchQueue:DispatchQueue = DispatchQueue(
            label:Constants.queueIdentifier,
            qos:DispatchQoS.userInteractive,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.main)
        return dispatchQueue
    }
}
