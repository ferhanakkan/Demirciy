//
//  DRequestModel.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 15.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import UIKit

public enum DRequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

open class DRequestModel: NSObject {
    
    // MARK: - Properties
    open var endpoint: URL {
        return DServiceManager.shared.baseURL.appendingPathComponent(path)
    }
    open var path: String {
        return ""
    }
    open var parameters: [String: Any?] {
        return [:]
    }
    open var headers: [String: String] {
        return [:]
    }
    open var method: DRequestHTTPMethod {
        return DRequestHTTPMethod.get
    }
    // (request, response)
    open var isLoggingEnabled: (Bool, Bool) {
        return (true, true)
    }
}

// MARK: - Public Functions
public extension DRequestModel {
    
    func urlRequest() -> URLRequest {
        var request: URLRequest!
        
        switch method {
        case DRequestHTTPMethod.get:
            var urlComponents = URLComponents(url: endpoint, resolvingAgainstBaseURL: true)!

            if !parameters.isEmpty {
                urlComponents.queryItems = []

                for parameter in parameters {
                    urlComponents.queryItems?.append(URLQueryItem(name: parameter.key, value: (parameter.value as? String) ?? ""))
                }
            }
            
            request = URLRequest(url: urlComponents.url!)
        case DRequestHTTPMethod.post:
            request = URLRequest(url: endpoint)
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                DLogManager.e("Request body parse error: \(error.localizedDescription)")
            }
        }

        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
}
