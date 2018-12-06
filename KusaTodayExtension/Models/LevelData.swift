//
//  LevelData.swift
//  KusaTodayExtension
//
//  Created by isaoeka on 2018/12/06.
//  Copyright © 2018 isaoeka. All rights reserved.
//

import UIKit

enum Level {
    case level0
    case level1
    case level2
    case level3
    case level4
    
    var color: UIColor {
        switch self {
        case .level0 : return UIColor(red: 230/255, green: 232/255, blue: 237/255, alpha: 1)
        case .level1 : return UIColor(red: 187/255, green: 255/255, blue: 120/255, alpha: 1)
        case .level2 : return UIColor(red: 107/255, green: 193/255, blue:  92/255, alpha: 1)
        case .level3 : return UIColor(red:  32/255, green: 140/255, blue:  45/255, alpha: 1)
        case .level4 : return UIColor(red:  22/255, green:  80/255, blue:  29/255, alpha: 1)
        }
    }
    
    init(value: Int) {
        switch value {
        case 0 : self = .level0
        case 1  ..< 5  : self = .level1
        case 5  ..< 10 : self = .level2
        case 10 ..< 15 : self = .level3
        default : self = .level4
        }
    }
}
