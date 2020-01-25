import ReactiveSwift
import Foundation
import Alamofire

open class NWClient: NWClientProtocol {
    
    // MARK: - Make Request
    
    public static func make(request: NWRequestProtocol) -> SignalProducer<Data, Error> {
        return SignalProducer<Data, Error> { observer, disposable in
            let alamofire = Alamofire.request(request.source, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).validate()
            alamofire.responseData { response in
                switch response.result {
                case .success(let data):
                    observer.send(value: data)
                    observer.sendCompleted()
                case .failure(let error):
                    #if DEBUG
                    print("[ERROR]: \(Date())")
                    print(error)
                    #endif
                    observer.send(error: error)
                }
            }
            disposable.observeEnded {
                alamofire.cancel()
            }
        }
    }
}
