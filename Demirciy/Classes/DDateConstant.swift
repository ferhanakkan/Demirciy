//
//  DDateConstant.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 26.04.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

public extension DConstant {
    
    class DDateConstant {
        
        public static let dateSeparator: String = "/"
        public static let timeSeparator: String = ":"
        
        public static let dateFormat_yyyyMMddHHmmssSSSZ: String = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" // "2020-04-14T11:21:09.347
        public static let dateFormat_yyyyMMddHHmmssSSSzzzz: String = "yyyy-MM-dd'T'HH:mm:ss.SSSzzzz" // "2020-07-10T15:52:51.455GMT+03:00"
        public static let dateFormat_ddMMyyyyHHmm: String = "dd\(DConstant.DDateConstant.dateSeparator)MM\(DConstant.DDateConstant.dateSeparator)yyyy HH\(DConstant.DDateConstant.timeSeparator)mm"
        public static let dateFormat_ddMMyyyy: String = "dd\(DConstant.DDateConstant.dateSeparator)MM\(DConstant.DDateConstant.dateSeparator)yyyy"
    }
}
