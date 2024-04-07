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
        imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.backgroundColor = .systemBackground.withAlphaComponent(0.8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

//MARK: - setup
extension CoverCollectionViewCell {
    
    func configure(url: String, title: String) {
        thumbnail.sd_setImage(with: URL(string: url), placeholderImage: nil, options:[.scaleDownLargeImages])
        titleLabel.text = title
        setupUI()
    }
    
    private func setupUI() {
        addSubview(thumbnail)
        addSubview(titleLabel)
        
    }
    
}
