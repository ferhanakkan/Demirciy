//
//  DMoyaLogPlugin.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 9.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import Moya

open class DMoyaLogPlugin: PluginType {
    
    public init() {}
    
    public func willSend(_ request: RequestType, target: TargetType) {
        if let urlRequest = request.request {
            DLogManager.req(urlRequest)
        }
    }
    
    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        DLogManager.res(result)
    }
}
