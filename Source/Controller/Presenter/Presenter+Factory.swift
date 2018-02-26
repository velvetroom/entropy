import Foundation

internal extension Presenter {
    internal class func factoryPrivateDispatch() -> DispatchQueue {
        let dispatchQueue:DispatchQueue = DispatchQueue(
            label:AudioStreamingManager.Constants.Dispatch.chaptersQueueLabel,
            qos:DispatchQoS.background,
            attributes:DispatchQueue.Attributes(),
            autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency.inherit,
            target:DispatchQueue.global(qos:DispatchQoS.QoSClass.background))
        
        return dispatchQueue
    }
}
