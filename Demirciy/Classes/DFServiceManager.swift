//
//  DFServiceManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public class DFServiceManager {
    
    // MARK: - Properties
    public static let shared: DFServiceManager = DFServiceManager()
    
    public var baseURL: String!
}

// MARK: - Public Functions
public extension DFServiceManager {
    
    func sendRequest<T: Codable>(request: DFRequestModel, completion: @escaping(Swift.Result<T, DFErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            DFLogManager.req(request)
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data, var responseModel = try? JSONDecoder().decode(DFResponseModel<T>.self, from: data) else {
                let error: DFErrorModel = DFErrorModel(DFError.parsing.rawValue)
                DFLogManager.err(error)

                completion(Result.failure(error))
                return
            }
            
            responseModel.rawData = data
            responseModel.request = request
            
            if request.isLoggingEnabled.1 {
                DFLogManager.res(responseModel)
            }
            
            if responseModel.isSuccess, let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(DFErrorModel.generalError()))
            }
        }.resume()
    }
}
