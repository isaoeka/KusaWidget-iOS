//
//  Applicable.swift
//  KusaWidget
//
//  Created by isaoeka on 2018/12/05.
//  Copyright © 2018 isaoeka. All rights reserved.
//

import Foundation

protocol Applicable {}
extension Applicable {
    @discardableResult
    func apply(block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
    
    func lets<R>(block: (Self) -> R) -> R {
        return block(self)
    }
}

extension NSObject: Applicable {}
