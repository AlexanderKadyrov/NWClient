import ReactiveSwift
import Foundation

public protocol NWServiceProtocol: class {
    static func make(request: NWRequestProtocol) -> SignalProducer<Data, Error>
}
