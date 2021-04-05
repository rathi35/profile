//
//  APIService.swift
//  Profile
//
//
//

import Foundation
import Alamofire

// MARK: Initialization
final class APIService: Equatable {
    static func == (lhs: APIService, rhs: APIService) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        let responseCacher = ResponseCacher(behavior: .cache)
        return Session(
            configuration: configuration,
            cachedResponseHandler: responseCacher)
        
    }()
    
    private var request: DataRequest?
    private var uuid = UUID().uuidString
    /**
     Base Request function, All the API request should use this method
     
     - Parameter request: any object which conforms to `APIRequestProtocol` protocol
     - Parameter type: Specify the class of reponse type, should confirm to `Decodable` protocol
     - Parameter completion: completion block which will be called on completion of API request
     
     - Returns: current request object which can be used to cancel the request.
     */
    @discardableResult
    func execute<T: Decodable>(request: APIRequestProtocol, completion: @escaping (T?, AFError?) -> Void)  -> APIService {
        debugPrint("URL Request", (try? request.asURLRequest().url?.absoluteString) ?? "")
        self.request = APIService.session.request(request).validate().responseDecodable(of: T.self) { (response) in
            switch response.result {
            case .success(let data):
                completion(data, response.error)
            case .failure(let error):
                completion(nil, error)
            }
        }
        return self
    }
    /**
     Calling this function will cancel the ongoing request, will not do nothing if request already completed.
     */
    func cancelRequest() {
        request?.cancel()
    }
}

// MARK: Home Screen APIs
extension APIService {
    /**
     get profile Information
     - Parameter completion: completion block which will be called on completion of API request
     
     - Returns: current request object which can be used to cancel the request.
     */
    func getProfileInfo(_ completion: @escaping ([Profile]?, AFError?) -> Void) -> APIService {
        let request = APIRequest.profileInfo
        return execute(request: request, completion: completion)
    }
}
