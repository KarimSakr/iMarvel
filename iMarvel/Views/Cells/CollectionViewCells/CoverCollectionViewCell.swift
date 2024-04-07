//
//  CoverCollectionViewCell.swift
//  iMarvel
//
//  Created by Karim Sakr on 06/04/2024.
//

import UIKit
import SDWebImage

class CoverCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CoverCollectionViewCell"
    
    private let thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.clipsToBounds = true
         return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - lifecycle
extension CoverCollectionViewCell {
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnail.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbnail.frame = contentView.bounds
        
        NSLayoutConstraint.activate([
            thumbnail.topAnchor.constraint(equalTo: self.topAnchor),
            thumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            thumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thumbnail.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

//MARK: - setup
extension CoverCollectionViewCell {
    
    func configure(url: String) {
        thumbnail.sd_setImage(with: URL(string: url), placeholderImage: nil, options:[.scaleDownLargeImages])
        setupUI()
    }
    
    private func setupUI() {
        addSubview(thumbnail)
        thumbnail.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
