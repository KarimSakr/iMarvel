//
//  CoverCollectionViewCell.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import UIKit

class CoverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CoverCollectionViewCell"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
