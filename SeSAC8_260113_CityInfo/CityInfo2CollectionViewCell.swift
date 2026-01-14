//
//  CityInfo2CollectionViewCell.swift
//  SeSAC8_260113_CityInfo
//
//  Created by Hwangseokbeom on 1/13/26.
//

import UIKit
import Kingfisher

final class CityInfo2CollectionViewCell: UICollectionViewCell {

    static let identifier = "CityInfo2CollectionViewCell"
    
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        cityImageView.clipsToBounds = true
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = cityImageView.bounds.width / 2
        
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
    
        subtitleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        subtitleLabel.textAlignment = .center
        subtitleLabel.textColor = .secondaryLabel
        subtitleLabel.numberOfLines = 2
        subtitleLabel.lineBreakMode = .byTruncatingTail
    }
    
    func configure(with city: City) {
        titleLabel.text = "\(city.city_name) · \(city.city_english_name)"
        subtitleLabel.text = city.city_explain
        
        let placeholder = UIImage(named: "6640187")
        
        cityImageView.backgroundColor = .systemGray5
        
        guard let url = URL(string: city.city_image) else {
            cityImageView.image = placeholder
            return
        }
        
        cityImageView.kf.setImage(
            with: url,
            placeholder: placeholder,
            options: [
                .transition(.fade(0.2)),
                .cacheOriginalImage
            ]
        )
    }
    
}

