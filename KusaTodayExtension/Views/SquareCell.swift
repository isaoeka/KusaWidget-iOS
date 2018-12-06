//
//  SquareCell.swift
//  KusaTodayExtension
//
//  Created by isaoeka on 2018/12/05.
//  Copyright © 2018 isaoeka. All rights reserved.
//

import UIKit

class SquareCell: UICollectionViewCell {

    public var dayNum: Int = 0 {
        didSet {
        }
    }
    public var level: Level = .level0 {
        didSet {
            self.backgroundColor = level.color
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //hide or reset anything you want hereafter, for example
        self.setupView()
    }
    
    private func setupView() {
        self.backgroundColor = Level.level0.color
        
    }
}
