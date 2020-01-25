import Foundation
import Alamofire

open class NWRequest: NWRequestProtocol {
    
    // MARK: - Properties
    
    public private(set) var encoding: ParameterEncoding
    public private(set) var parameters: Parameters?
    public private(set) var headers: HTTPHeaders?
    public private(set) var method: HTTPMethod
    public private(set) var source: String
    
    // MARK: - Initialization
    
    public init(source: String, method: HTTPMethod = .get, encoding: ParameterEncoding = URLEncoding.queryString, headers: HTTPHeaders? = nil, parameters: Parameters? = nil) {
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.method = method
        self.source = source
    }
}
