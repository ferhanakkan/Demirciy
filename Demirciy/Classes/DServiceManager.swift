//
//  DServiceManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import Alamofire
import RxSwift
import RxAlamofire

public class DServiceManager {
    
    // MARK: - Properties
    public static let shared: DServiceManager = DServiceManager()
    
    public var baseURL: URL!
    
    private let disposeBag: DisposeBag = DisposeBag()
}

// MARK: - Public Functions
public extension DServiceManager {
    
    func sendRequestWithURLSession<T: Codable>(request: DRequestModel, completion: @escaping(Swift.Result<T, DErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            DLogManager.req(request)
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data, var responseModel = try? JSONDecoder().decode(DResponseModel<T>.self, from: data) else {
                let error: DErrorModel = DErrorModel(DError.parsing.rawValue)
                DLogManager.err(error)

                completion(Swift.Result.failure(error))
                return
            }
            
            responseModel.rawData = data
            responseModel.request = request
            
            if request.isLoggingEnabled.1 {
                DLogManager.res(responseModel)
            }
            
            if responseModel.isSuccess, let data = responseModel.data {
                completion(Swift.Result.success(data))
            } else {
                completion(Swift.Result.failure(responseModel.error))
            }
        }.resume()
    }
    
    func sendRequestWithRxAlamofire<T: Codable>(request: DRequestModel, completion: @escaping(Swift.Result<T, DErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            DLogManager.req(request)
        }
        
        RxAlamofire.requestData(Alamofire.HTTPMethod(rawValue: request.method.rawValue), request.endpoint, parameters: request.parameters as Parameters, headers: HTTPHeaders(request.headers)).subscribe(onNext: { (response, data) in
            if var responseModel = try? JSONDecoder().decode(DResponseModel<T>.self, from: data) {
                responseModel.rawData = data
                responseModel.request = request
                
                if request.isLoggingEnabled.1 {
                    DLogManager.res(responseModel)
                }
                
                if responseModel.isSuccess, let data = responseModel.data {
                    completion(Swift.Result.success(data))
                } else {
                    completion(Swift.Result.failure(responseModel.error))
                }
                return
            }
            
            let error: DErrorModel = DErrorModel(DError.parsing.rawValue)
            DLogManager.err(error)
            
            completion(Swift.Result.failure(error))
        }, onError: { (error) in
            DLogManager.custom(error.localizedDescription)
            completion(Swift.Result.failure(DErrorModel.generalError()))
        }).disposed(by: disposeBag)
    }
    
    func sendRequestWithRxAlamofireViaURLRequest<T: Codable>(request: DRequestModel, completion: @escaping(Swift.Result<T, DErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            DLogManager.req(request)
        }
        
        RxAlamofire.requestData(request.urlRequest()).subscribe(onNext: { (response, data) in
            if var responseModel = try? JSONDecoder().decode(DResponseModel<T>.self, from: data) {
                responseModel.rawData = data
                responseModel.request = request
                
                if request.isLoggingEnabled.1 {
                    DLogManager.res(responseModel)
                }
                
                if responseModel.isSuccess, let data = responseModel.data {
                    completion(Swift.Result.success(data))
                } else {
                    completion(Swift.Result.failure(responseModel.error))
                }
                return
            }
            
            let error: DErrorModel = DErrorModel(DError.parsing.rawValue)
            DLogManager.err(error)
            
            completion(Swift.Result.failure(error))
        }, onError: { (error) in
            DLogManager.custom(error.localizedDescription)
            completion(Swift.Result.failure(DErrorModel.generalError()))
        }).disposed(by: disposeBag)
    }
    
    func sendRequestWithPromiseKit() {}
}
