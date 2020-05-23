//
//  DLogManager.swift
//  DemirciyFramework
//
//  Created by Yusuf Demirci on 7.12.2019.
//  Copyright © 2019 Yusuf Demirci. All rights reserved.
//

import Moya

private enum LogType: String {
    case e = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}

public class DLogManager {
    
    // MARK: - Properties
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    private static let logPrefix: String = "DLogManager:"
    private static let dateFormat: String = "hh:mm:ss"
    private static let maxRequestBodyValueLength: Int = 1000
    private static let maxResponseLength: Int = 10000
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Public Functions
public extension DLogManager {
    
    class func e( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.e.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func i ( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.i.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func d( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.d.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func v( _ object: Any, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.v.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object)")
        }
    }
    
    class func w( _ object: Any?, filename: String = #file, line: Int = #line, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.w.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(funcName) -> \(object!)")
        }
    }
    
    class func s( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if isLoggingEnabled {
            print("\(logPrefix) \(Date().toString()) \(LogType.s.rawValue)[\(sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    class func req(_ request: DRequestModel) {
        guard isLoggingEnabled else { return }
        
        let path: String = request.path
        let headers: String = String(describing: request.headers)
        let httpMethod: String = String(describing: request.method.rawValue)
        var parameters: String = ""
        var parametersStrings: [String] = []
        for (_, value) in request.parameters.enumerated() {
            if let valueValue = value.value {
                parametersStrings.append("\(value.key): \(type(of: valueValue))(\(valueValue))")
            } else {
                parametersStrings.append("\(value.key): nil")
            }
        }
        parameters = parametersStrings.joined(separator: ", ")
        
        var log: String = "[\(String(describing: DServiceManager.shared.baseURL))\(path)]"
        
        if !request.headers.isEmpty {
            log = log + "\n\(headers)"
        }
        
        log = log + "\n[\(httpMethod)]"
        
        if !request.parameters.isEmpty {
            log = log + "\n[\(parameters)]"
        }
        
        print("\(logPrefix) \n--- Request ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
    }
    
    class func req(_ urlRequest: URLRequest) {
        guard isLoggingEnabled else { return }
        
        let url: String = urlRequest.url?.relativeString ?? "-no url-"
        let headers: String = String(describing: urlRequest.headers)
        let httpMethod: String = urlRequest.httpMethod ?? "-no http method-"
        var parameters: String = ""
        
        if let bodyData = urlRequest.httpBody, let body = bodyData.toDictionary() {
            var parametersStrings: [String] = []
            
            for (_, value) in body.enumerated() {
                if let valueValue = value.value {
                    if let valueString: String = valueValue as? String {
                        if valueString.count > DLogManager.maxRequestBodyValueLength {
                            parametersStrings.append("\(value.key): \(valueString[0...DLogManager.maxRequestBodyValueLength])...")
                        } else {
                            parametersStrings.append("\(value.key): \(valueString)")
                        }
                    } else {
                        parametersStrings.append("\(value.key): \(valueValue)")
                    }
                } else {
                    parametersStrings.append("\(value.key): nil")
                }
            }
            
            parameters = parametersStrings.joined(separator: ", ")
        }
        
        var log: String = "[\(url)]"
        
        if !headers.isEmpty {
            log = log + "\n[\(headers)]"
        }
        
        log = log + "\n[\(httpMethod)]"
        
        if !parameters.isEmpty {
            log = log + "\n[\(parameters)]"
        }
        
        print("\(logPrefix) \n--- Request ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
    }
    
    class func res<T: Codable>(_ response: DResponseModel<T>) {
        guard isLoggingEnabled else { return }
        
        let path: String? = response.request?.path
        let isSuccess: Bool = response.isSuccess
        let message: String = response.message
        let dataJSON: String? = response.json
        
        var log: String = ""
        
        if let path = path {
            log = log + "[\(String(describing: DServiceManager.shared.baseURL))\(path)]\n"
        }
        
        log = log + "[isSuccess: \(isSuccess)]\n[message: \(message)]"
        
        if let json = dataJSON {
            log = log + "\n[\(json)]"
        }
        
        print("\(logPrefix) \n--- Response ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
    }
    
    class func res(_ result: Result<Response, MoyaError>) {
        guard isLoggingEnabled else { return }
        
        do {
            let response = try result.get()
            
            let url: String = response.request?.url?.relativeString ?? "-no url-"
            let dataJSON: String? = String(data: response.data, encoding: String.Encoding.utf8)
            
            var log: String = "[\(url)]"
            
            if let json = dataJSON {
                if json.count > DLogManager.maxResponseLength {
                    log = log + "\n[\(json[0...DLogManager.maxResponseLength])...]"
                } else {
                    log = log + "\n[\(json)]"
                }
            }
            
            print("\(logPrefix) \n--- Response ---\n[\(Date().toString())] \n\(log) \n--- End ---\n")
        } catch {}
    }
    
    class func err(_ error: DErrorModel) {
        guard isLoggingEnabled else { return }
        
        let errorKey: String? = error.messageKey
        let errorMessage: String? = error.message
        
        var log: String = ""
        
        if let errorKey = errorKey {
            log = log + "\n[key: \(errorKey)]"
        }
        if let errorMessage = errorMessage {
            log = log + "\n[message: \(errorMessage)]"
        }
        
        if log.isEmpty { return }
        
        print("\(logPrefix) \n--- Error ---\n[\(Date().toString())] \(log) \n--- End ---\n")
    }
    
    class func custom(_ log: String) {
        guard isLoggingEnabled else { return }
        
        print("\(logPrefix) [\(Date().toString())] \(log)")
    }
}

// MARK: - Private Functions
private extension DLogManager {
    
    /// Extract the file name from the file path
    ///
    /// - Parameter filePath: Full file path in bundle
    /// - Returns: File Name with extension
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

internal extension Date {
    func toString() -> String {
        return DLogManager.dateFormatter.string(from: self as Date)
    }
}
