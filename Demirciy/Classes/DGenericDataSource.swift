//
//  DGenericDataSource.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 4.05.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

open class DGenericDataSource<T> : NSObject {
    var data: DDynamicValue<[T]> = DDynamicValue([])
}
