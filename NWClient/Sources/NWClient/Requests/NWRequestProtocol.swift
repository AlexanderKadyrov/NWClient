import Foundation
import Alamofire

public protocol NWRequestProtocol: class {
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var method: HTTPMethod { get }
    var source: String { get }
}
