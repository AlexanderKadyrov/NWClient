import ReactiveSwift
import Foundation
import Alamofire

open class NWClient: NWClientProtocol {
    
    // MARK: - Make Request
    
    public static func make(request: NWRequestProtocol) -> SignalProducer<Data, Error> {
        return SignalProducer<Data, Error> { observer, disposable in
            
            guard let source = request.source else {
                observer.send(error: NSError.errorBadRequest)
                return
            }
            
            let alamofire = Alamofire.request(source, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).validate()
            
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

fileprivate extension Error {
    static var errorBadRequest: Error {
        return NSError(domain: "flight.com", code: 400, userInfo: [NSLocalizedDescriptionKey: "Bad request"])
    }
}
