//
//  CharacterCardCollectionViewCell.swift
//  iMarvel
//
//  Created by Karim Sakr on 05/04/2024.
//

import UIKit
import SDWebImage

class CharacterCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CharacterCardCollectionViewCell"
    
    let characterThumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .white
        imageView.clipsToBounds = true
         return imageView
    }()
    
    private let characterNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.backgroundColor = .systemBackground.withAlphaComponent(0.8)
        return label
    }()
    
    func configure(with character: HomeModels.ViewModels.Character) {
        
        characterNameLabel.text = character.name
        characterThumbnail.sd_setImage(with: URL(string: character.thumbnailUrl))
        setupUI()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(characterThumbnail)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - Lifecycle
extension CharacterCardCollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        characterThumbnail.frame = contentView.bounds
        
        NSLayoutConstraint.activate([
            characterThumbnail.topAnchor.constraint(equalTo: self.topAnchor),
            characterThumbnail.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            characterThumbnail.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            characterThumbnail.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            characterNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            characterNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            characterNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        characterThumbnail.image = nil
    }
}

//MARK: - setup
extension CharacterCardCollectionViewCell {
    
    private func setupUI() {
        
        self.backgroundColor = .systemGray6
        
        addSubview(characterThumbnail)
        characterThumbnail.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(characterNameLabel)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
