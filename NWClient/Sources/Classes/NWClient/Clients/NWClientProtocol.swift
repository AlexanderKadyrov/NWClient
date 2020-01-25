import ReactiveSwift
import Foundation

public protocol NWClientProtocol: class {
    static func make(request: NWRequestProtocol) -> SignalProducer<Data, Error>
}
