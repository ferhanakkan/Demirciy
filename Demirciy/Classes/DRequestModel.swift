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
    open var path: String {
        return ""
    }
    var parameters: [String: Any?] {
        return [:]
    }
    open var headers: [String: String] {
        return [:]
    }
    open var method: DRequestHTTPMethod {
        return body.isEmpty ? DRequestHTTPMethod.get : DRequestHTTPMethod.post
    }
    open var body: [String: Any?] {
        return [:]
    }
    // (request, response)
    open var isLoggingEnabled: (Bool, Bool) {
        return (true, true)
    }
}

// MARK: - Public Functions
public extension DRequestModel {
    
    func urlRequest() -> URLRequest {
        var endpoint: String = DServiceManager.shared.baseURL.appending(path)
        
        for parameter in parameters {
            if let value = parameter.value as? String {
                endpoint.append("?\(parameter.key)=\(value)")
            }
        }
        
        var request: URLRequest = URLRequest(url: URL(string: endpoint)!)
        
        request.httpMethod = method.rawValue
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        if method == DRequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch let error {
                DLogManager.e("Request body parse error: \(error.localizedDescription)")
            }
        }
        
        return request
    }
}
