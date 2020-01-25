import ReactiveSwift
import Foundation

open class NWService: NWServiceProtocol {
    
    // MARK: - Make Request
    
    public static func make(request: NWRequestProtocol) -> SignalProducer<Data, Error> {
        return NWClient.make(request: request)
    }
}
