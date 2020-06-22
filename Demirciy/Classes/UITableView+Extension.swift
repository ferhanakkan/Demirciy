//
//  UITableView+Extension.swift
//  Demirciy
//
//  Created by Yusuf Demirci on 22.06.2020.
//  Copyright © 2020 Yusuf Demirci. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func register(_ cells: [UITableViewCell.Type]) {
        for cell in cells {
            register(cell.self, forCellReuseIdentifier: cell.identifier)
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        return dequeueReusableCell(withIdentifier: T.identifier) as! T
    }
}
