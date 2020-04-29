//
//  DServiceManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 10.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

public class DServiceManager {
    
    // MARK: - Properties
    public static let shared: DServiceManager = DServiceManager()
    
    public var baseURL: String!
}

// MARK: - Public Functions
public extension DServiceManager {
    
    func sendRequest<T: Codable>(request: DRequestModel, completion: @escaping(Swift.Result<T, DErrorModel>) -> Void) {
        if request.isLoggingEnabled.0 {
            DLogManager.req(request)
        }
        
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            guard let data = data, var responseModel = try? JSONDecoder().decode(DResponseModel<T>.self, from: data) else {
                let error: DErrorModel = DErrorModel(DError.parsing.rawValue)
                DLogManager.err(error)

                completion(Result.failure(error))
                return
            }
            
            responseModel.rawData = data
            responseModel.request = request
            
            if request.isLoggingEnabled.1 {
                DLogManager.res(responseModel)
            }
            
            if responseModel.isSuccess, let data = responseModel.data {
                completion(Result.success(data))
            } else {
                completion(Result.failure(responseModel.error))
            }
        }.resume()
    }
}
